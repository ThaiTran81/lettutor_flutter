import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lettutor_thaitran81/data/model/mentor/MentorSummary.dart';
import 'package:lettutor_thaitran81/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_thaitran81/data/model/schedule/ScheduleData.dart';
import 'package:lettutor_thaitran81/data/model/schedule/ScheduleResponse.dart';
import 'package:lettutor_thaitran81/data/model/tutor/CriteriaSearchRequest.dart';
import 'package:lettutor_thaitran81/data/model/tutor/Filters.dart';
import 'package:lettutor_thaitran81/data/model/tutor/Tutor.dart';
import 'package:lettutor_thaitran81/data/model/tutor/TutorResponse.dart';
import 'package:lettutor_thaitran81/data/repository/schedule_repository.dart';
import 'package:lettutor_thaitran81/data/repository/tutor_repository.dart';
import 'package:lettutor_thaitran81/data/repository/user_repository.dart';
import 'package:lettutor_thaitran81/di/components/service_locator.dart';
import 'package:lettutor_thaitran81/mock/userData.dart';
import 'package:lettutor_thaitran81/utils/dialog_utils.dart';
import 'package:lettutor_thaitran81/utils/simple_worker.dart';

class MentorsScreenProvider extends ChangeNotifier {
  static const int LIMIT_PER_PAGE = 10;

  var mentorsResponse = UserMock.users;

  String search = "";

  Timer? timeHandle;

  String? type = "instractors";

  List<MentorSummary> mentorSumaries = UserMock.mentorSummary;

  List<Tutor> tutors = List.empty(growable: true);

  int currentPage = 1;

  bool isLoadingMore = false;

  int totalTutors = 0;
  TutorSpecialty selectedSpecialtyFilter = TutorSpecialty.ALL;

  TextEditingController searchTextFieldController = TextEditingController();

  late CriteriaSearchRequest criteria;

  ScheduleData? upcomingMeeting;

  int totalLessonHour = 0;

  var tutorRepository = getIt<TutorRepository>();
  ScheduleRepository _scheduleRepository = getIt.get<ScheduleRepository>();
  UserRepository _userRepository = getIt.get<UserRepository>();

  MentorsScreenProvider() {
    // initializeData();
  }

  void getSearchValue() {
    search = searchTextFieldController.text ?? "";
    if (timeHandle != null) {
      timeHandle!.cancel();
    }
    timeHandle = Timer(const Duration(seconds: 1), () {
      getTutorListByCriteria();
    });
  }

  void getTutorList(int pageNumber) async {
    SimpleWorker<TutorListResponse?>(
      task: () => tutorRepository.getTutorList(LIMIT_PER_PAGE, pageNumber),
      onCompleted: (res) {
        if (res != null && res.tutors != null) {
          totalTutors = res.tutors?.count ?? 0;
          setTutors(res.tutors?.rows);
        }
      },
    ).start();
  }

  setTutors(List<Tutor>? tutors) {
    this.tutors = tutors ?? List.empty(growable: true);
    notifyListeners();
  }

  Future<void> loadMoreTutorListResult(bool isAppend) async {
    if (totalTutors != null && tutors.length >= totalTutors!) {
      setLoadingMoreIs(false);
      return;
    }
    currentPage++;

    buildCriteria();
    criteria.page = currentPage;
    TutorListResponse? res = await tutorRepository.getTutorListBy(criteria);
    if (res != null && res.tutors != null) {
      totalTutors = res.tutors?.count ?? 0;
      addTutors(res.tutors?.rows);
      setLoadingMoreIs(false);
    }
  }

  addTutors(List<Tutor>? res) {
    if (res != null) {
      tutors.addAll(res);
    }
    notifyListeners();
  }

  setLoadingMoreIs(bool value) {
    isLoadingMore = value;
    notifyListeners();
  }

  setSelectedSpecialtyFilter(TutorSpecialty tutorSpecialty) {
    selectedSpecialtyFilter = tutorSpecialty;
    notifyListeners();
  }

  void getTutorListByCriteria() {
    buildCriteria();

    SimpleWorker<TutorListResponse?>(
      task: () => tutorRepository.getTutorListBy(criteria),
      onCompleted: (res) {
        if (res != null && res.tutors != null) {
          totalTutors = res.tutors?.count ?? 0;
          setTutors(res.tutors?.rows);
        }
      },
    ).start();
  }

  void buildCriteria() {
    List<String>? specialties;
    if (selectedSpecialtyFilter == TutorSpecialty.ALL) {
      specialties = null;
    } else {
      var code = selectedSpecialtyFilter.toCode();
      specialties = [code];
    }
    var searchValue = search.isEmpty ? null : search;
    criteria = CriteriaSearchRequest(
        filters: Filters(specialties: specialties),
        search: searchValue,
        perPage: LIMIT_PER_PAGE,
        page: 1);
  }

  void resetCriteria() {
    selectedSpecialtyFilter = TutorSpecialty.ALL;
    search = '';
    currentPage = 1;
    searchTextFieldController.clear();
    getTutorListByCriteria();
  }

  void initializeData() {
    getTutorListByCriteria();

    SimpleWorker<ScheduleResponse?>(
        task: () => _scheduleRepository.getBookedClass(1, 1),
        onCompleted: (res) {
          if (res != null && (res.data?.count ?? 0) > 0) {
            ScheduleData? scheduleData = res.data?.rows?.first;
            if (scheduleData != null) setUpcomingMeeting(scheduleData);
          }
        }).start();

    _userRepository.getTotalHour().then((value) {
      setTotalLessonHour(value);
    });
  }

  void sendFavoriteTutor(String userId, BuildContext context) {
    tutorRepository.setFavoriteTutor(userId).then((value) {
      var processTutor =
          tutors.where((element) => element.userId == userId).first;
      processTutor.isfavoritetutor = value.result ?? false;
      notifyListeners();
      var msg = value.result ?? false
          ? "added to favorite successfully"
          : "Removed from favorite";
      Fluttertoast.showToast(msg: msg);
    }, onError: (e) {
      DialogUtils.showInform(
          context: context,
          msgBody: "Oops!! Something go wrong! please try again!");
    });
  }

  void setUpcomingMeeting(ScheduleData scheduleData) {
    upcomingMeeting = scheduleData;
    notifyListeners();
  }

  void setTotalLessonHour(int value) {
    totalLessonHour = value;
    notifyListeners();
  }
}

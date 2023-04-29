import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lettutor_flutter/data/model/mentor/MentorSummary.dart';
import 'package:lettutor_flutter/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_flutter/data/model/tutor/CriteriaSearchRequest.dart';
import 'package:lettutor_flutter/data/model/tutor/Filters.dart';
import 'package:lettutor_flutter/data/model/tutor/Rows.dart';
import 'package:lettutor_flutter/data/model/tutor/TutorResponse.dart';
import 'package:lettutor_flutter/data/repository/tutor_repository.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/mock/userData.dart';
import 'package:lettutor_flutter/utils/simple_worker.dart';

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
  int? totalTutors = null;
  TutorSpecialty selectedSpecialtyFilter = TutorSpecialty.ALL;
  TextEditingController searchTextFieldController = TextEditingController();

  late CriteriaSearchRequest criteria;

  var tutorRepository = getIt<TutorRepository>();

  MentorsScreenProvider() {
    getTutorList(currentPage);
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
    SimpleWorker<TutorResponse?>(
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
    if (isLoadingMore) {
      currentPage++;
    }
    criteria.page = currentPage;
    TutorResponse? res = await tutorRepository.getTutorListBy(criteria);
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

    SimpleWorker<TutorResponse?>(
      task: () => tutorRepository.getTutorListBy(criteria),
      onCompleted: (res) {
        if (res != null && res.tutors != null) {
          totalTutors = res.tutors?.count ?? 0;
          setTutors(res.tutors?.rows);
        }
      },
    ).start();
  }

  void resetCriteria() {
    selectedSpecialtyFilter = TutorSpecialty.ALL;
    search = '';
    currentPage = 1;
    searchTextFieldController.clear();
    getTutorListByCriteria();
  }
}

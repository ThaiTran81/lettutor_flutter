import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lettutor_flutter/data/model/mentor/MentorSummary.dart';
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
  bool isLoadedMore = true;
  int? totalTutors = null;

  var tutorRepository = getIt<TutorRepository>();

  MentorsScreenProvider() {
    getTutorList(currentPage);
  }

  void getSearchValue(String? searchCode) {
    search = searchCode ?? "";
    if (timeHandle != null) {
      timeHandle!.cancel();
    }
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

  Future<void> getTutorListFrom(bool isAppend) async {
    if (totalTutors != null && tutors.length >= totalTutors!) {
      setLoadingMoreIs(false);
      return;
    }
    if (isLoadingMore) {
      currentPage++;
    }
    TutorResponse? res =
        await tutorRepository.getTutorList(LIMIT_PER_PAGE, currentPage);
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
}

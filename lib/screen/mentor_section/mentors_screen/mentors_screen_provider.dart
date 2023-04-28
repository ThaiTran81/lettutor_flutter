import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lettutor_flutter/data/model/mentor/MentorSummary.dart';
import 'package:lettutor_flutter/data/model/tutor/Rows.dart';
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
  List<Tutor>? tutors = List.empty(growable: true);

  var tutorRepository = getIt<TutorRepository>();

  MentorsScreenProvider() {
    getTutorList(1);
  }

  void getSearchValue(String? searchCode) {
    search = searchCode ?? "";
    if (timeHandle != null) {
      timeHandle!.cancel();
    }

    // timeHandle = Timer(const Duration(seconds: 1), () {
    //   getTutorList(LIMIT_PER_PAGE, 1);
    //   notifyListeners();
    // });

    //print("controller page $searchCode");
  }

  void getTutorList(int pageNumber) async {
    SimpleWorker<List<Tutor>?>(
      task: () => tutorRepository.getTutorList(LIMIT_PER_PAGE, pageNumber),
      onCompleted: (res) {
        if (res != null) {
          setTutors(res);
        }
      },
    ).start();
  }

  setTutors(List<Tutor> tutors) {
    this.tutors = tutors;
    notifyListeners();
  }
}

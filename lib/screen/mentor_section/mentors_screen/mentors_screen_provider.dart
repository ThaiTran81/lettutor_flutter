import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lettutor_flutter/data/model/mentor/MentorSummary.dart';
import 'package:lettutor_flutter/mock/userData.dart';

// import 'package:lms/data/model/mentors_response/mentors_response.dart';
// import 'package:lms/data/repository/metors_repository/mentors_repository.dart';

class MentorsScreenProvider extends ChangeNotifier {
  // MentorsResponse? mentorsResponse;
  var mentorsResponse = UserMock.users;
  String search = "";
  Timer? timeHandle;
  String? type = "instractors";
  List<MentorSummary> mentorSumaries = UserMock.mentorSummary;

  MentorsScreenProvider() {
    mentorsScreenApi(type, search);
  }
  void getSearchValue(String? searchCode) {
    search = searchCode ?? "";
    if (timeHandle != null) {
      timeHandle!.cancel();
    }

    timeHandle = Timer(const Duration(seconds: 1), () {
      mentorsScreenApi(type, search);
      notifyListeners();
    });

    //print("controller page $searchCode");
  }

  void mentorsScreenApi(String? type, String? search) async {
    // var apiResponse =
    //     await MentorsRepository.getMentorsRepositoryData(type, search);
    //
    // if (apiResponse.success == true) {
    //   mentorsResponse = apiResponse.data;
    //   notifyListeners();
    // }
  }
}

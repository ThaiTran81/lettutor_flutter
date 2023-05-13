import 'package:flutter/material.dart';
import 'package:lettutor_flutter/data/model/user/UpdateUserRequest.dart';
import 'package:lettutor_flutter/data/model/user/User.dart';
import 'package:lettutor_flutter/data/repository/user_repository.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/screen/profile/widget/basic_info_content.dart';
import 'package:lettutor_flutter/utils/simple_worker.dart';

class MyProfileProvider extends ChangeNotifier {
  final UserRepository _userRepository = getIt.get<UserRepository>();

  void updateUserInfo(BasicInfoFormData basicInfoFormData) {
    SimpleWorker<UserData?>(
      task: () {
        UpdateUserRequest request = UpdateUserRequest(
            name: basicInfoFormData.name,
            country: basicInfoFormData.country,
            studyLevel: basicInfoFormData.studyLevel,
            birthday: basicInfoFormData.dob.toString(),
            testPreparations: basicInfoFormData.testPreparations,
            learnTopics: basicInfoFormData.specialities,
            phone: basicInfoFormData.phoneNumber,
            studySchedule: basicInfoFormData.studySchedule);
        _userRepository.updateUser(request);
      },
      onCompleted: (data) {
        print("done");
      },
    ).start();
  }
}

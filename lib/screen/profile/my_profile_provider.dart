import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/data/model/user/UpdateUserRequest.dart';
import 'package:lettutor_thaitran81/data/model/user/User.dart';
import 'package:lettutor_thaitran81/data/repository/user_repository.dart';
import 'package:lettutor_thaitran81/di/components/service_locator.dart';
import 'package:lettutor_thaitran81/provider/auth_provider.dart';
import 'package:lettutor_thaitran81/screen/profile/widget/basic_info_content.dart';
import 'package:lettutor_thaitran81/utils/simple_worker.dart';

class MyProfileProvider extends ChangeNotifier {
  final UserRepository _userRepository = getIt.get<UserRepository>();
  final AuthProvider _authProvider = getIt.get<AuthProvider>();

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
              return _userRepository.updateUser(request);
            },
            onCompleted: (data) {
              _authProvider.setUserData(data!);
            },
            messageOnSuccess: "Updated successfully")
        .start();
  }

  void updateAvatar(List<int> imageBytes, String filename) async {
    SimpleWorker<UserData?>(
            task: () => _userRepository.uploadAvatar(imageBytes, filename),
            onCompleted: (data) {
              if (data != null && data.avatar != null) {
                _authProvider.updateAvatarUrl(data.avatar!);
              }
            },
            messageOnSuccess: "Changed Avatar Successfully!")
        .start();
  }
}

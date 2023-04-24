import 'package:flutter/material.dart';

class MyProfileProvider extends ChangeNotifier {
  // ProfileResponse? profileResponse;
  // UserCertificateResponse? userCertificateResponse;
  // String? userName;
  // String? userAvatar;
  // String? userJoinDate;
  //
  // MyProfileProvider() {
  //   getUserData();
  //   myProfileApi();
  //   userCertificateApi();
  // }
  //
  // void myProfileApi() async {
  //   var apiResponse = await ProfileRepository.getProfileRepositoryData();
  //
  //   if (apiResponse.success == true) {
  //     profileResponse = apiResponse.data;
  //     notifyListeners();
  //   }
  // }
  //
  // void getUserData() async {
  //   userName = await SPUtill.getValue(SPUtill.keyName);
  //   userAvatar = await SPUtill.getValue(SPUtill.keyAvatar);
  //   userJoinDate = await SPUtill.getValue(SPUtill.keyJoinDate);
  //
  //   notifyListeners();
  // }
  //
  // void userCertificateApi() async {
  //   var apiResponse =
  //       await UserCertificateRepository.getUserCertificateRepositoryData();
  //
  //   if (apiResponse.success == true) {
  //     userCertificateResponse = apiResponse.data;
  //     notifyListeners();
  //   }
  // }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../utils/nav_utils.dart';
import '../../bottom_nav_bar/bottom_nav_bar.dart';
// import 'package:lms/data/body_response/auth_body/body_login.dart';
// import 'package:lms/data/repository/auth_repository/auth_repository.dart';
// import 'package:lms/utils/shared_preferences.dart';

// import '../../../data/model/auth_response/login_response.dart';
// import '../../home/bottom_nav_bar/bottom_nav_bar.dart';

class LogInProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  // void setDataSharePreferences(ResponseLogin? responseLogin) {
  //   SPUtill.setValue(SPUtill.keyAuthToken, responseLogin?.data?.token);
  //   SPUtill.setValue(SPUtill.keyName, responseLogin?.data?.name);
  //   SPUtill.setValue(SPUtill.keyEmail, responseLogin?.data?.email);
  //   SPUtill.setValue(SPUtill.keyMobile, responseLogin?.data?.mobile);
  //   SPUtill.setValue(SPUtill.keyAvatar, responseLogin?.data?.avatar);
  //   SPUtill.setValue(SPUtill.keyStatus, responseLogin?.data?.status);
  //   SPUtill.setValue(SPUtill.keyJoinDate, responseLogin?.data?.joinDate);
  // }

  void loginApi(context) async {
    // var bodyLogin =
    //     BodyLogin(email: nameController.text, password: passController.text);
    // var apiResponse = await AuthRepository.getLogin(bodyLogin);
    //
    // if (apiResponse.success == true) {
    //   setDataSharePreferences(apiResponse.data);
    //    NavUtil.pushAndRemoveUntil(context,const BottomNavBar());
    //    Fluttertoast.showToast(
    //        msg: apiResponse.message ?? '',
    //        toastLength: Toast.LENGTH_SHORT,
    //        gravity: ToastGravity.BOTTOM,
    //        timeInSecForIosWeb: 1,
    //        backgroundColor: Colors.green,
    //        textColor: Colors.white,
    //        fontSize: 16.0);
    // } else {
    //   Fluttertoast.showToast(
    //       msg: apiResponse.message ?? '',
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // }

    NavUtil.pushAndRemoveUntil(context,const BottomNavBar());
    notifyListeners();
  }
}

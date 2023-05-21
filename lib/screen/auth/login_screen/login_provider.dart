import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/data/repository/user_repository.dart';
import 'package:lettutor_thaitran81/di/components/service_locator.dart';
import 'package:lettutor_thaitran81/utils/dialog_utils.dart';
import 'package:lettutor_thaitran81/utils/simple_worker.dart';

// import 'package:lms/data/body_response/auth_body/body_login.dart';
// import 'package:lms/data/repository/auth_repository/auth_repository.dart';
// import 'package:lms/utils/shared_preferences.dart';

// import '../../../data/model/auth_response/login_response.dart';
// import '../../home/bottom_nav_bar/bottom_nav_bar.dart';

class LogInProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final UserRepository _userRepository = getIt<UserRepository>();

  void loginApi(context) async {
    SimpleWorker(
        task: () =>
            _userRepository.login(nameController.text, passController.text),
        onCompleted: <UserData>(res) {
          return null;
        },
        onError: (e) {
          processLoginError(context, e);
        }).start();
  }

  void processLoginError(BuildContext context, Exception err) {
    if (err is DioError) {
      DioError dioError = err;
      var res = dioError.response?.data;

      if (res['statusCode'] == 400) {
        DialogUtils.showInform(context: context, msgBody: res['message']);
      }
    } else {
      DialogUtils.showInform(context: context, msgBody: err.toString());
    }
  }
}

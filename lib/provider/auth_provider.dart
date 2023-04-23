import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor_flutter/data/model/user/UserData.dart';
import 'package:lettutor_flutter/data/repository/user_repository.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/utils/dialog_utils.dart';
import 'package:lettutor_flutter/utils/simple_worker.dart';

class AuthProvider extends ChangeNotifier {
  UserData? userData;

  final UserRepository _userRepository = getIt<UserRepository>();

  void loginApi(BuildContext context, String email, String password) async {
    SimpleWorker<UserData>(
        task: () => _userRepository.login(email, password),
        onCompleted: (res) {
          UserData? data = res;
          setUserData(data);
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

  void setUserData(UserData? userData) {
    this.userData = userData;
    notifyListeners();
  }
}

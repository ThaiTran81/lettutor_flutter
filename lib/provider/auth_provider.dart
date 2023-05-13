import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor_flutter/data/local/utils/SecureStorageUtils.dart';
import 'package:lettutor_flutter/data/model/user/User.dart';
import 'package:lettutor_flutter/data/model/user/UserData.dart';
import 'package:lettutor_flutter/data/repository/user_repository.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/utils/dialog_utils.dart';
import 'package:lettutor_flutter/utils/simple_worker.dart';

class AuthProvider extends ChangeNotifier {
  UserResponse? userData;

  final UserRepository _userRepository = getIt<UserRepository>();

  void loginApi(BuildContext context, String email, String password,
      Function()? callBack) async {
    SimpleWorker<UserResponse>(
        task: () => _userRepository.login(email, password),
        onCompleted: (res) {
          onLoginCompleted(res);
          callBack!();
        },
        onError: (e) {
          processLoginError(context, e);
        }).start();
  }

  void onLoginCompleted(UserResponse res) {
    UserResponse? data = res;
    setUserData(data);
    if (data.tokens != null) {
      SecureStorageUtils.setValue(
          SecureStorageUtils.keyAuthToken, data.tokens?.access.token);
    }
  }

  void signUp(BuildContext context, String email, String password,
      Function()? callback) {
    SimpleWorker<Null>(
        task: () => _userRepository.signUp(email, password),
        onCompleted: (data) {
          callback!();
        },
        onError: (e) {
          processLoginError(context, e);
        }).start();
  }

  void processLoginError(BuildContext context, Exception err) {
    if (err is DioError) {
      DioError dioError = err;
      var res = dioError.response?.data;
      if (res == null) {
        DialogUtils.showInform(
            context: context,
            msgBody: 'Cannot connect to server! please try again!');
      } else if (res['statusCode'] == 400) {
        DialogUtils.showInform(context: context, msgBody: res['message']);
      }
    } else {
      DialogUtils.showInform(context: context, msgBody: err.toString());
    }
  }

  void setUserData(UserResponse? userData) {
    this.userData = userData;
    notifyListeners();
  }

  String? getUserAvatarUrl() {
    if (userData != null) {
      return userData?.user?.avatar;
    }
    return null;
  }

  String? getUserFullname() {
    if (userData != null) {
      return userData?.user?.name;
    }
    return null;
  }

  UserData? getUserData() {
    return userData?.user;
  }
}

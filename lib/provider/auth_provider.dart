import 'package:flutter/cupertino.dart';
import 'package:lettutor_flutter/data/model/user/UserData.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/auth_api.dart';

class AuthProvider extends ChangeNotifier {
  UserData? userData;
  late AuthApi authApi;

  // login by email and password
  void login(
      String email, String password, Function(UserData userData) callBack) {
    authApi.login(email, password).then(callBack);
  }
}

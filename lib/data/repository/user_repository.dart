import 'package:lettutor_flutter/data/model/user/UserData.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/auth_api.dart';

class UserRepository {
  final AuthApi _authApi;

  UserRepository(this._authApi);

  Future<UserData> login(String email, String password) async {
    var userData = await _authApi.login(email, password);
    return userData;
  }

  void signUp(String email, String password) async {
    await _authApi.signUp(email, password);
  }

  Future<int> getTotalHour() async {
    var res = await _authApi.getTotalHour();
    return res ?? 0;
  }
}

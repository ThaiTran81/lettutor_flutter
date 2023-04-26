import 'package:lettutor_flutter/data/model/user/UserData.dart';
import 'package:lettutor_flutter/data/network/constants/endpoints.dart';

import '../../dio_client.dart';

class AuthApi {
  // dio instance
  final DioClient _dioClient;

  AuthApi(this._dioClient);

  Future<UserData> login(String email, String password) async {
    try {
      var data = {'email': email, 'password': password};
      final res = await _dioClient.post(Endpoints.login, data: data);
      return UserData.fromJson(res);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
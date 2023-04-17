import 'package:lettutor_flutter/data/network/constants/endpoints.dart';
import 'package:lettutor_flutter/model/user/UserData.dart';

import '../../dio_client.dart';

class AuthApi {
  // dio instance
  final DioClient _dioClient;

  AuthApi(this._dioClient);

  Future<UserData> login(String email, String password) async {
    try {
      final res = await _dioClient.get(Endpoints.login);
      return UserData.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}

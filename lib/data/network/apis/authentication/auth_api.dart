import 'package:flutter/foundation.dart';
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
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  Future<void> signUp(String email, String password) async {
    var dataBody = {'email': email, 'password': password, 'source': null};
    try {
      await _dioClient.post(Endpoints.register, data: dataBody);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  Future<int> getTotalHour() async {
    var res = await _dioClient.get(Endpoints.getTotalHour);
    return res['total'] ?? 0;
  }
}

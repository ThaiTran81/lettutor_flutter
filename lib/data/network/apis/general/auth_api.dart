import 'package:dio/src/form_data.dart';
import 'package:flutter/foundation.dart';
import 'package:lettutor_thaitran81/data/model/user/UpdateUserRequest.dart';
import 'package:lettutor_thaitran81/data/model/user/User.dart';
import 'package:lettutor_thaitran81/data/model/user/UserData.dart';
import 'package:lettutor_thaitran81/data/network/constants/endpoints.dart';

import '../../dio_client.dart';

class AuthApi {
  // dio instance
  final DioClient _dioClient;

  AuthApi(this._dioClient);

  Future<UserResponse> login(String email, String password) async {
    try {
      var data = {'email': email, 'password': password};
      final res = await _dioClient.post(Endpoints.login, data: data);
      return UserResponse.fromJson(res);
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

  Future<UserData> updateUser(UpdateUserRequest request) async {
    var res =
        await _dioClient.put(Endpoints.updateUser, data: request.toJson());
    return UserData.fromJson(res['user']);
  }

  Future<UserData> uploadAvatar(FormData request) async {
    var res = await _dioClient.post(Endpoints.uploadAvatar, data: request);
    return UserData.fromJson(res);
  }
}

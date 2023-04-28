import 'package:lettutor_flutter/data/model/tutor/TutorResponse.dart';
import 'package:lettutor_flutter/data/network/constants/endpoints.dart';

import '../../dio_client.dart';

class TutorApi {
  // dio instance
  final DioClient _dioClient;

  TutorApi(this._dioClient);

  Future<TutorResponse?> getListTutorWithPagination(int limit, int page) async {
    final res =
        await _dioClient.get(Endpoints.getListTutorWithPagination(limit, page));
    return TutorResponse.fromJson(res);
  }
}

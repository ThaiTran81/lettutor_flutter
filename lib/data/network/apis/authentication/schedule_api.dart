import 'package:lettutor_flutter/data/model/schedule/ScheduleResponse.dart';
import 'package:lettutor_flutter/data/network/constants/endpoints.dart';

import '../../dio_client.dart';

class ScheduleApi {
  // dio instance
  final DioClient _dioClient;

  ScheduleApi(this._dioClient);

  Future<ScheduleResponse> getBookedClass(int perPage, int page) async {
    final res = await _dioClient.get(Endpoints.getBookedClass(perPage, page,
        (DateTime.now().microsecondsSinceEpoch ~/ 1000).toInt()));

    return ScheduleResponse.fromJson(res);
  }

  Future<ScheduleResponse> getHistoryBookedClass(int perPage, int page) async {
    final res = await _dioClient.get(Endpoints.getHistoryBookedClass(perPage,
        page, (DateTime.now().microsecondsSinceEpoch ~/ 1000000).toInt()));
    return ScheduleResponse.fromJson(res);
  }
}

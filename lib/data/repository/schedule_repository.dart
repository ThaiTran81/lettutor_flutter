import 'package:lettutor_flutter/data/model/schedule/ScheduleResponse.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/schedule_api.dart';

class ScheduleRepository {
  final ScheduleApi _scheduleApi;

  ScheduleRepository(this._scheduleApi);

  Future<ScheduleResponse> getBookedClass(int perPage, int page) async {
    final res = await _scheduleApi.getBookedClass(perPage, page);
    return res;
  }

  Future<ScheduleResponse> getBookedClassHistory(int perPage, int page) async {
    final res = await _scheduleApi.getHistoryBookedClass(perPage, page);
    return res;
  }
}

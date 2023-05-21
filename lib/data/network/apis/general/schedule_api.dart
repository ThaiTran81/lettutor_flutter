import 'package:lettutor_thaitran81/data/model/schedule/BookingScheduleReponse.dart';
import 'package:lettutor_thaitran81/data/model/schedule/ScheduleResponse.dart';
import 'package:lettutor_thaitran81/data/network/constants/endpoints.dart';

import '../../dio_client.dart';

class ScheduleApi {
  // dio instance
  final DioClient _dioClient;

  ScheduleApi(this._dioClient);

  Future<ScheduleResponse> getBookedClass(int perPage, int page) async {
    final res = await _dioClient.get(Endpoints.getBookedClass(perPage, page,
        (DateTime.now().millisecondsSinceEpoch).toInt()));

    return ScheduleResponse.fromJson(res);
  }

  Future<ScheduleResponse> getHistoryBookedClass(int perPage, int page) async {
    final res = await _dioClient.get(Endpoints.getHistoryBookedClass(perPage,
        page, (DateTime.now().millisecondsSinceEpoch).toInt()));
    return ScheduleResponse.fromJson(res);
  }

  Future<dynamic> getScheduleByTutorId(String tutorId) async {
    final res = await _dioClient
        .post(Endpoints.getScheduleByTutorId, data: {"tutorId": tutorId});
    return res;
  }

  Future<dynamic> getScheduleByTutorIdAndDate(
      String tutorId, DateTime dateTime) async {
    DateTime endOfDay = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      23,
      59,
      59,
      999,
    );
    final res = await _dioClient.get(
        Endpoints.getScheduleByTutorIdAndTime(tutorId, dateTime, endOfDay));
    return res;
  }

  Future<BookingScheduleReponse> bookSchedule(
      String scheduleId, String? note) async {
    final res = await _dioClient.post(Endpoints.booking, data: {
      "scheduleDetailIds": [scheduleId],
      "note": note
    });
    return BookingScheduleReponse.fromJson(res);
  }

  Future<dynamic> cancelSchedule(String scheduleDetailId, int cancelId, String note) async{
    var data = {
      "cancelInfo": {
        "cancelReasonId": cancelId,
        "note": note
      },
      "scheduleDetailId": scheduleDetailId
    };

    final res = await _dioClient.delete(Endpoints.cancelSchedule, data: data);
    return res;
  }
}

import 'package:lettutor_thaitran81/data/model/mentor/TutorSchedule.dart';
import 'package:lettutor_thaitran81/data/model/schedule/BookingScheduleReponse.dart';
import 'package:lettutor_thaitran81/data/model/schedule/ScheduleResponse.dart';
import 'package:lettutor_thaitran81/data/model/schedule/cancel_reason.dart';
import 'package:lettutor_thaitran81/data/network/apis/general/schedule_api.dart';

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

  Future<List<TutorSchedule>> getScheduleByTutorId(String tutorId) async {
    final res = await _scheduleApi.getScheduleByTutorId(tutorId);
    List<TutorSchedule> list = [];
    var data = res["data"];
    if (data != null) {
      data.forEach((v) {
        list.add(TutorSchedule.fromJson(v));
      });
    }
    return list;
  }

  Future<List<TutorSchedule>> getScheduleByTutorIdAndDate(
      String tutorId, DateTime dateTime) async {
    final res =
        await _scheduleApi.getScheduleByTutorIdAndDate(tutorId, dateTime);
    List<TutorSchedule> list = [];
    var data = res["scheduleOfTutor"];
    if (data != null) {
      data.forEach((v) {
        list.add(TutorSchedule.fromJson(v));
      });
    }
    return list;
  }

  Future<BookingScheduleReponse> bookSchedule(
      String scheduleId, String? note) async {
    final res = await _scheduleApi.bookSchedule(scheduleId, note);
    return res;
  }

  Future<dynamic> cancelSchedule(String scheduleDetailId, CancelReason cancelReason, String note) async{
    final res = await _scheduleApi.cancelSchedule(scheduleDetailId, cancelReason.cancelId, note);
    return res;
  }
}

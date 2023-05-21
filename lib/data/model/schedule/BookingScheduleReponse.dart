import 'package:lettutor_thaitran81/data/model/mentor/BookingInfo.dart';

class BookingScheduleReponse {
  BookingScheduleReponse({
    this.message,
    this.data,});

  BookingScheduleReponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BookingInfo.fromJson(v));
      });
    }
  }

  String? message;
  List<BookingInfo>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    final data = this.data;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
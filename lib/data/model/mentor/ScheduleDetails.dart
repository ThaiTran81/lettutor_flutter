import 'BookingInfo.dart';

class ScheduleDetail {
  ScheduleDetail({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.bookingInfo,
    this.isBooked,
  });

  ScheduleDetail.fromJson(dynamic json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['bookingInfo'] != null) {
      bookingInfo = [];
      json['bookingInfo'].forEach((v) {
        bookingInfo?.add(BookingInfo.fromJson(v));
      });
    }
    isBooked = json['isBooked'];
  }

  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  List<BookingInfo>? bookingInfo;
  bool? isBooked;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['startPeriodTimestamp'] = startPeriodTimestamp;
    map['endPeriodTimestamp'] = endPeriodTimestamp;
    map['id'] = id;
    map['scheduleId'] = scheduleId;
    map['startPeriod'] = startPeriod;
    map['endPeriod'] = endPeriod;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    final bookingInfo = this.bookingInfo;
    if (bookingInfo != null) {
      map['bookingInfo'] = bookingInfo.map((v) => v.toJson()).toList();
    }
    map['isBooked'] = isBooked;
    return map;
  }
}

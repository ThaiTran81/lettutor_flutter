import 'ScheduleInfo.dart';

class ScheduleDetailInfo {
  ScheduleDetailInfo({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.scheduleInfo,});

  ScheduleDetailInfo.fromJson(dynamic json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    scheduleInfo = json['scheduleInfo'] != null
        ? ScheduleInfo.fromJson(json['scheduleInfo'])
        : null;
  }

  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  ScheduleInfo? scheduleInfo;

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
    final scheduleInfo = this.scheduleInfo;
    if (scheduleInfo != null) {
      map['scheduleInfo'] = scheduleInfo.toJson();
    }
    return map;
  }

}
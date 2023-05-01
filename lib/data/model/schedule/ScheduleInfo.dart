import 'package:lettutor_flutter/data/model/tutor/Tutor.dart';

class ScheduleInfo {
  ScheduleInfo({
    this.date,
    this.startTimestamp,
    this.endTimestamp,
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.tutorInfo,
  });

  ScheduleInfo.fromJson(dynamic json) {
    date = json['date'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    tutorInfo =
        json['tutorInfo'] != null ? Tutor.fromJson(json['tutorInfo']) : null;
  }

  String? date;
  int? startTimestamp;
  int? endTimestamp;
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  Tutor? tutorInfo;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['date'] = date;
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
    map['id'] = id;
    map['tutorId'] = tutorId;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['isDeleted'] = isDeleted;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    final tutorInfo = this.tutorInfo;
    if (tutorInfo != null) {
      map['tutorInfo'] = tutorInfo.toJson();
    }
    return map;
  }
}

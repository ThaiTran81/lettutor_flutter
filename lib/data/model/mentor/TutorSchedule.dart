import 'ScheduleDetails.dart';

class TutorSchedule {
  TutorSchedule({
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.startTimestamp,
    this.endTimestamp,
    this.createdAt,
    this.isBooked,
    this.scheduleDetails,
  });

  TutorSchedule.fromJson(dynamic json) {
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    createdAt = json['createdAt'];
    isBooked = json['isBooked'];
    if (json['scheduleDetails'] != null) {
      scheduleDetails = [];
      json['scheduleDetails'].forEach((v) {
        scheduleDetails?.add(ScheduleDetail.fromJson(v));
      });
    }
  }

  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  int? startTimestamp;
  int? endTimestamp;
  String? createdAt;
  bool? isBooked;
  List<ScheduleDetail>? scheduleDetails;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['tutorId'] = tutorId;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
    map['createdAt'] = createdAt;
    map['isBooked'] = isBooked;
    final scheduleDetails = this.scheduleDetails;
    if (scheduleDetails != null) {
      map['scheduleDetails'] = scheduleDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

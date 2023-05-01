import 'ScheduleDetailInfo.dart';

class ScheduleData {
  ScheduleData({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.userId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    this.cancelReasonId,
    this.lessonPlanId,
    this.cancelNote,
    this.calendarId,
    this.isDeleted,
    this.scheduleDetailInfo,
    this.classReview,
    this.showRecordUrl,
    this.studentMaterials,
    this.feedbacks,
  });

  ScheduleData.fromJson(dynamic json) {
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
    tutorMeetingLink = json['tutorMeetingLink'];
    studentMeetingLink = json['studentMeetingLink'];
    studentRequest = json['studentRequest'];
    tutorReview = json['tutorReview'];
    scoreByTutor = json['scoreByTutor'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    recordUrl = json['recordUrl'];
    cancelReasonId = json['cancelReasonId'];
    lessonPlanId = json['lessonPlanId'];
    cancelNote = json['cancelNote'];
    calendarId = json['calendarId'];
    isDeleted = json['isDeleted'];
    scheduleDetailInfo = json['scheduleDetailInfo'] != null
        ? ScheduleDetailInfo.fromJson(json['scheduleDetailInfo'])
        : null;
    classReview = json['classReview'];
    showRecordUrl = json['showRecordUrl'];
    // if (json['studentMaterials'] != null) {
    //   studentMaterials = [];
    //   json['studentMaterials'].forEach((v) {
    //     studentMaterials.add(Dynamic.fromJson(v));
    //   });
    // }
    // if (json['feedbacks'] != null) {
    //   feedbacks = [];
    //   json['feedbacks'].forEach((v) {
    //     feedbacks.add(Dynamic.fromJson(v));
    //   });
    // }
  }

  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  dynamic studentRequest;
  dynamic tutorReview;
  dynamic scoreByTutor;
  String? createdAt;
  String? updatedAt;
  dynamic recordUrl;
  dynamic cancelReasonId;
  dynamic lessonPlanId;
  dynamic cancelNote;
  dynamic calendarId;
  bool? isDeleted;
  ScheduleDetailInfo? scheduleDetailInfo;
  dynamic classReview;
  bool? showRecordUrl;
  List<dynamic>? studentMaterials;
  List<dynamic>? feedbacks;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['createdAtTimeStamp'] = createdAtTimeStamp;
    map['updatedAtTimeStamp'] = updatedAtTimeStamp;
    map['id'] = id;
    map['userId'] = userId;
    map['scheduleDetailId'] = scheduleDetailId;
    map['tutorMeetingLink'] = tutorMeetingLink;
    map['studentMeetingLink'] = studentMeetingLink;
    map['studentRequest'] = studentRequest;
    map['tutorReview'] = tutorReview;
    map['scoreByTutor'] = scoreByTutor;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['recordUrl'] = recordUrl;
    map['cancelReasonId'] = cancelReasonId;
    map['lessonPlanId'] = lessonPlanId;
    map['cancelNote'] = cancelNote;
    map['calendarId'] = calendarId;
    map['isDeleted'] = isDeleted;
    final scheduleDetailInfo = this.scheduleDetailInfo;
    if (scheduleDetailInfo != null) {
      map['scheduleDetailInfo'] = scheduleDetailInfo.toJson();
    }
    map['classReview'] = classReview;
    map['showRecordUrl'] = showRecordUrl;
    final studentMaterials = this.studentMaterials;
    if (studentMaterials != null) {
      map['studentMaterials'] =
          studentMaterials.map((v) => v.toJson()).toList();
    }
    final feedbacks = this.feedbacks;
    if (feedbacks != null) {
      map['feedbacks'] = feedbacks.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

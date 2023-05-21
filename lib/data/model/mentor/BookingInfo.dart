class BookingInfo {
  BookingInfo({
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
  });

  BookingInfo.fromJson(dynamic json) {
    createdAtTimeStamp = json['createdAtTimeStamp'];
    updatedAtTimeStamp = json['updatedAtTimeStamp'];
    id = json['id'];
    userId = json['userId'];
    scheduleDetailId = json['scheduleDetailId'];
    tutorMeetingLink = json['tutorMeetingLink'];
    studentMeetingLink = json['studentMeetingLink'];
    studentRequest = json['studentRequest'];
    tutorReview = json['tutorReview'];
    int? scoreByTutor = json['scoreByTutor'];
    this.scoreByTutor = scoreByTutor?.toDouble();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    recordUrl = json['recordUrl'];
    cancelReasonId = json['cancelReasonId'];
    lessonPlanId = json['lessonPlanId'];
    cancelNote = json['cancelNote'];
    calendarId = json['calendarId'];
    isDeleted = json['isDeleted'];
  }

  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  double? scoreByTutor;
  String? createdAt;
  String? updatedAt;
  String? recordUrl;
  int? cancelReasonId;
  int? lessonPlanId;
  String? cancelNote;
  int? calendarId;
  bool? isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    return map;
  }
}

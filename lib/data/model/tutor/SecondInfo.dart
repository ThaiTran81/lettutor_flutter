import 'TutorInfo.dart';

class SecondInfo {
  SecondInfo({
    this.id,
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
    this.tutorInfo,
  });

  SecondInfo.fromJson(dynamic json) {
    id = json['id'];
    level = json['level'];
    email = json['email'];
    google = json['google'];
    facebook = json['facebook'];
    apple = json['apple'];
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    phone = json['phone'];
    language = json['language'];
    birthday = json['birthday'];
    requestPassword = json['requestPassword'];
    isActivated = json['isActivated'];
    isPhoneActivated = json['isPhoneActivated'];
    requireNote = json['requireNote'];
    timezone = json['timezone'];
    phoneAuth = json['phoneAuth'];
    isPhoneAuthActivated = json['isPhoneAuthActivated'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
    isPublicRecord = json['isPublicRecord'];
    caredByStaffId = json['caredByStaffId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    studentGroupId = json['studentGroupId'];
    tutorInfo = json['tutorInfo'] != null
        ? TutorInfo.fromJson(json['tutorInfo'])
        : null;
  }

  String? id;
  String? level;
  String? email;
  dynamic google;
  dynamic facebook;
  dynamic apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  dynamic isPhoneActivated;
  dynamic requireNote;
  int? timezone;
  dynamic phoneAuth;
  bool? isPhoneAuthActivated;
  String? studySchedule;
  bool? canSendMessage;
  bool? isPublicRecord;
  dynamic caredByStaffId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic studentGroupId;
  TutorInfo? tutorInfo;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['level'] = level;
    map['email'] = email;
    map['google'] = google;
    map['facebook'] = facebook;
    map['apple'] = apple;
    map['avatar'] = avatar;
    map['name'] = name;
    map['country'] = country;
    map['phone'] = phone;
    map['language'] = language;
    map['birthday'] = birthday;
    map['requestPassword'] = requestPassword;
    map['isActivated'] = isActivated;
    map['isPhoneActivated'] = isPhoneActivated;
    map['requireNote'] = requireNote;
    map['timezone'] = timezone;
    map['phoneAuth'] = phoneAuth;
    map['isPhoneAuthActivated'] = isPhoneAuthActivated;
    map['studySchedule'] = studySchedule;
    map['canSendMessage'] = canSendMessage;
    map['isPublicRecord'] = isPublicRecord;
    map['caredByStaffId'] = caredByStaffId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['deletedAt'] = deletedAt;
    map['studentGroupId'] = studentGroupId;
    final tutorInfo = this.tutorInfo;
    if (tutorInfo != null) {
      map['tutorInfo'] = tutorInfo.toJson();
    }
    return map;
  }
}

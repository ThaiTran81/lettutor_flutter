import 'Feedbacks.dart';

class Tutor {
  Tutor({
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
    this.feedbacks,
    this.id,
    this.userId,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.resume,
    this.rating,
    this.isNative,
    this.price,
    this.isOnline,
  });

  Tutor.fromJson(dynamic json) {
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
    if (json['feedbacks'] != null) {
      feedbacks = [];
      json['feedbacks'].forEach((v) {
        feedbacks?.add(Feedbacks.fromJson(v));
      });
    }
    id = json['id'];
    userId = json['userId'];
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    accent = json['accent'];
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    languages = json['languages'];
    specialties = json['specialties'];
    resume = json['resume'];
    rating = json['rating'];
    isNative = json['isNative'];
    price = json['price'];
    isOnline = json['isOnline'];
  }

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
  List<Feedbacks>? feedbacks;
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  dynamic accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  dynamic resume;
  double? rating;
  dynamic isNative;
  int? price;
  bool? isOnline;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
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
    final feedbacks = this.feedbacks;
    if (feedbacks != null) {
      map['feedbacks'] = feedbacks.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['userId'] = userId;
    map['video'] = video;
    map['bio'] = bio;
    map['education'] = education;
    map['experience'] = experience;
    map['profession'] = profession;
    map['accent'] = accent;
    map['targetStudent'] = targetStudent;
    map['interests'] = interests;
    map['languages'] = languages;
    map['specialties'] = specialties;
    map['resume'] = resume;
    map['rating'] = rating;
    map['isNative'] = isNative;
    map['price'] = price;
    map['isOnline'] = isOnline;
    return map;
  }
}

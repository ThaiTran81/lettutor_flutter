class TutorInfo {
  TutorInfo({
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
    this.isActivated,
    this.isNative,
    this.createdAt,
    this.updatedAt,
  });

  TutorInfo.fromJson(dynamic json) {
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
    isActivated = json['isActivated'];
    isNative = json['isNative'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

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
  bool? isActivated;
  dynamic isNative;
  String? createdAt;
  String? updatedAt;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
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
    map['isActivated'] = isActivated;
    map['isNative'] = isNative;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

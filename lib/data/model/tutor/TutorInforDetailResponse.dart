import 'TutorUser.dart';

class TutorInforDetailResponse {
  TutorInforDetailResponse({
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
    this.rating,
    this.isNative,
    this.user,
    this.isFavorite,
    this.avgRating,
    this.totalFeedback,
  });

  TutorInforDetailResponse.fromJson(dynamic json) {
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
    rating = json['rating'];
    isNative = json['isNative'];
    user = json['User'] != null ? TutorUser.fromJson(json['User']) : null;
    isFavorite = json['isFavorite'];
    avgRating = json['avgRating'];
    totalFeedback = json['totalFeedback'];
  }

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
  double? rating;
  dynamic isNative;
  TutorUser? user;
  bool? isFavorite;
  num? avgRating;
  int? totalFeedback;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
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
    map['rating'] = rating;
    map['isNative'] = isNative;
    final user = this.user;
    if (user != null) {
      map['User'] = user.toJson();
    }
    map['isFavorite'] = isFavorite;
    map['avgRating'] = avgRating;
    map['totalFeedback'] = totalFeedback;
    return map;
  }
}

import 'Courses.dart';

class TutorUser {
  TutorUser({
    this.id,
    this.level,
    this.avatar,
    this.name,
    this.country,
    this.language,
    this.isPublicRecord,
    this.caredByStaffId,
    this.studentGroupId,
    this.courses,
  });

  TutorUser.fromJson(dynamic json) {
    id = json['id'];
    level = json['level'];
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    language = json['language'];
    isPublicRecord = json['isPublicRecord'];
    caredByStaffId = json['caredByStaffId'];
    studentGroupId = json['studentGroupId'];
    if (json['courses'] != null) {
      courses = [];
      json['courses'].forEach((v) {
        courses?.add(TutorCourse.fromJson(v));
      });
    }
  }

  String? id;
  String? level;
  String? avatar;
  String? name;
  String? country;
  String? language;
  bool? isPublicRecord;
  dynamic caredByStaffId;
  dynamic studentGroupId;
  List<TutorCourse>? courses;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['level'] = level;
    map['avatar'] = avatar;
    map['name'] = name;
    map['country'] = country;
    map['language'] = language;
    map['isPublicRecord'] = isPublicRecord;
    map['caredByStaffId'] = caredByStaffId;
    map['studentGroupId'] = studentGroupId;
    final courses = this.courses;
    if (courses != null) {
      map['courses'] = courses.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

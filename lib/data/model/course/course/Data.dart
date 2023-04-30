import 'CourseInfo.dart';

class Data {
  Data({
    this.count,
    this.courses,
  });

  Data.fromJson(dynamic json) {
    count = json['count'];
    if (json['rows'] != null) {
      courses = [];
      json['rows'].forEach((v) {
        courses?.add(CourseInfo.fromJson(v));
      });
    }
  }

  int? count;
  List<CourseInfo>? courses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    final courses = this.courses;
    if (courses != null) {
      map['rows'] = courses.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

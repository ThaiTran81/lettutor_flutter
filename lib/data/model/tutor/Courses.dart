class TutorCourse {
  TutorCourse({
    this.id,
    this.name,
    this.tutorCourse,
  });

  TutorCourse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    tutorCourse = json['TutorCourse'] != null
        ? TutorCourse.fromJson(json['TutorCourse'])
        : null;
  }

  String? id;
  String? name;
  TutorCourse? tutorCourse;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    final tutorCourse = this.tutorCourse;
    if (tutorCourse != null) {
      map['TutorCourse'] = tutorCourse.toJson();
    }
    return map;
  }
}

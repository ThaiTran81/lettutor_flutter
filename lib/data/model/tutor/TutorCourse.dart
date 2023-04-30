class TutorCourse {
  TutorCourse({
    this.userId,
    this.courseId,
    this.createdAt,
    this.updatedAt,
  });

  TutorCourse.fromJson(dynamic json) {
    userId = json['UserId'];
    courseId = json['CourseId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? userId;
  String? courseId;
  String? createdAt;
  String? updatedAt;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['UserId'] = userId;
    map['CourseId'] = courseId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

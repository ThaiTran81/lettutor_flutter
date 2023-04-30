class CourseTopic {
  CourseTopic({
    this.id,
    this.courseId,
    this.orderCourse,
    this.name,
    this.nameFile,
    this.numberOfPages,
    this.description,
    this.videoUrl,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  CourseTopic.fromJson(dynamic json) {
    id = json['id'];
    courseId = json['courseId'];
    orderCourse = json['orderCourse'];
    name = json['name'];
    nameFile = json['nameFile'];
    numberOfPages = json['numberOfPages'];
    description = json['description'];
    videoUrl = json['videoUrl'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  String? nameFile;
  dynamic numberOfPages;
  String? description;
  dynamic videoUrl;
  dynamic type;
  String? createdAt;
  String? updatedAt;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['courseId'] = courseId;
    map['orderCourse'] = orderCourse;
    map['name'] = name;
    map['nameFile'] = nameFile;
    map['numberOfPages'] = numberOfPages;
    map['description'] = description;
    map['videoUrl'] = videoUrl;
    map['type'] = type;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

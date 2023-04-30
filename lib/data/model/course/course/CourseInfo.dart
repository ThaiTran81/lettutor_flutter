import 'Categories.dart';
import 'Topics.dart';

class CourseInfo {
  CourseInfo({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.defaultPrice,
    this.coursePrice,
    this.courseType,
    this.sectionType,
    this.visible,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
    this.topics,
    this.categories,});

  CourseInfo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    level = int.parse(json['level'] ?? 0);
    reason = json['reason'];
    purpose = json['purpose'];
    otherDetails = json['other_details'];
    defaultPrice = json['default_price'];
    coursePrice = json['course_price'];
    courseType = json['courseType'];
    sectionType = json['sectionType'];
    visible = json['visible'];
    displayOrder = json['displayOrder'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['topics'] != null) {
      topics = [];
      json['topics'].forEach((v) {
        topics?.add(CourseTopic.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }

  String? id;
  String? name;
  String? description;
  String? imageUrl;
  int? level;
  String? reason;
  String? purpose;
  String? otherDetails;
  int? defaultPrice;
  int? coursePrice;
  dynamic courseType;
  dynamic sectionType;
  bool? visible;
  dynamic displayOrder;
  String? createdAt;
  String? updatedAt;
  List<CourseTopic>? topics;
  List<Categories>? categories;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['level'] = level;
    map['reason'] = reason;
    map['purpose'] = purpose;
    map['other_details'] = otherDetails;
    map['default_price'] = defaultPrice;
    map['course_price'] = coursePrice;
    map['courseType'] = courseType;
    map['sectionType'] = sectionType;
    map['visible'] = visible;
    map['displayOrder'] = displayOrder;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    final topics = this.topics;
    if (topics != null) {
      map['topics'] = topics.map((v) => v.toJson()).toList();
    }
    final categories = this.categories;
    if (categories != null) {
      map['categories'] = categories.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
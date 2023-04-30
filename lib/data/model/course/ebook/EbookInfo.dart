import 'Categories.dart';

class EbookInfo {
  EbookInfo({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.visible,
    this.fileUrl,
    this.createdAt,
    this.updatedAt,
    this.isPrivate,
    this.createdBy,
    this.categories,
  });

  EbookInfo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    level = int.parse(json['level'] ?? '0');
    visible = json['visible'];
    fileUrl = json['fileUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isPrivate = json['isPrivate'];
    createdBy = json['createdBy'];
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
  bool? visible;
  String? fileUrl;
  String? createdAt;
  String? updatedAt;
  dynamic isPrivate;
  dynamic createdBy;
  List<Categories>? categories;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['level'] = level;
    map['visible'] = visible;
    map['fileUrl'] = fileUrl;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['isPrivate'] = isPrivate;
    map['createdBy'] = createdBy;
    final categories = this.categories;
    if (categories != null) {
      map['categories'] = categories.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

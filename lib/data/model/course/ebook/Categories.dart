class Categories {
  Categories({
    this.id,
    this.title,
    this.description,
    this.key,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
  });

  Categories.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    key = json['key'];
    displayOrder = json['displayOrder'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  String? title;
  dynamic description;
  String? key;
  dynamic displayOrder;
  String? createdAt;
  String? updatedAt;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['key'] = key;
    map['displayOrder'] = displayOrder;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

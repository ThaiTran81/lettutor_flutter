class Categorie {
  Categorie({
    this.id,
    this.title,
    this.description,
    this.key,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
  });

  Categorie.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    key = json['key'];
    displayOrder = json['displayOrder'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  String? id;
  String? title;
  String? description;
  String? key;
  String? displayOrder;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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

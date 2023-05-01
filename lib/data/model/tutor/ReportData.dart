class ReportData {
  ReportData({
    this.id,
    this.userId,
    this.tutorId,
    this.content,
    this.updatedAt,
    this.createdAt,
  });

  ReportData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    tutorId = json['tutorId'];
    content = json['content'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  String? id;
  String? userId;
  String? tutorId;
  String? content;
  String? updatedAt;
  String? createdAt;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['tutorId'] = tutorId;
    map['content'] = content;
    map['updatedAt'] = updatedAt;
    map['createdAt'] = createdAt;
    return map;
  }
}

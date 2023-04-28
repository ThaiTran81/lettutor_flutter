import 'FirstInfo.dart';

class Feedbacks {
  Feedbacks({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });

  Feedbacks.fromJson(dynamic json) {
    id = json['id'];
    bookingId = json['bookingId'];
    firstId = json['firstId'];
    secondId = json['secondId'];
    rating = json['rating'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    firstInfo = json['firstInfo'] != null
        ? FirstInfo.fromJson(json['firstInfo'])
        : null;
  }

  String? id;
  String? bookingId;
  String? firstId;
  String? secondId;
  int? rating;
  String? content;
  String? createdAt;
  String? updatedAt;
  FirstInfo? firstInfo;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['bookingId'] = bookingId;
    map['firstId'] = firstId;
    map['secondId'] = secondId;
    map['rating'] = rating;
    map['content'] = content;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    final firstInfo = this.firstInfo;
    if (firstInfo != null) {
      map['firstInfo'] = firstInfo.toJson();
    }
    return map;
  }
}

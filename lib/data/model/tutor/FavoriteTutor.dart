import 'SecondInfo.dart';

class FavoriteTutor {
  FavoriteTutor({
    this.id,
    this.firstId,
    this.secondId,
    this.createdAt,
    this.updatedAt,
    this.secondInfo,});

  FavoriteTutor.fromJson(dynamic json) {
    id = json['id'];
    firstId = json['firstId'];
    secondId = json['secondId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    secondInfo =
    json['secondInfo'] != null ? SecondInfo.fromJson(json['secondInfo']) : null;
  }

  String? id;
  String? firstId;
  String? secondId;
  String? createdAt;
  String? updatedAt;
  SecondInfo? secondInfo;

  Map<String?, dynamic> toJson() {
    final map = <String?, dynamic>{};
    map['id'] = id;
    map['firstId'] = firstId;
    map['secondId'] = secondId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    final secondInfo = this.secondInfo;
    if (secondInfo != null) {
      map['secondInfo'] = secondInfo.toJson();
    }
    return map;
  }

}
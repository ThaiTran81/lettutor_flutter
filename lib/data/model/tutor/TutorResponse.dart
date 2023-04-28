import 'FavoriteTutor.dart';
import 'Tutors.dart';

class TutorResponse {
  TutorResponse({
    this.tutors,
    this.favoriteTutor,
  });

  TutorResponse.fromJson(dynamic json) {
    tutors = json['tutors'] != null ? Tutors.fromJson(json['tutors']) : null;
    if (json['favoriteTutor'] != null) {
      favoriteTutor = [];
      json['favoriteTutor'].forEach((v) {
        favoriteTutor?.add(FavoriteTutor.fromJson(v));
      });
    }
  }

  Tutors? tutors;
  List<FavoriteTutor>? favoriteTutor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final tutors = this.tutors;
    if (tutors != null) {
      map['tutors'] = tutors.toJson();
    }
    final favoriteTutor = this.favoriteTutor;
    if (favoriteTutor != null) {
      map['favoriteTutor'] = favoriteTutor.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

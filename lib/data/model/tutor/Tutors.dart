import 'Rows.dart';

class Tutors {
  Tutors({
    this.count,
    this.rows,
  });

  Tutors.fromJson(dynamic json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = [];
      json['rows'].forEach((v) {
        rows?.add(Tutor.fromJson(v));
      });
    }
  }

  int? count;
  List<Tutor>? rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    final rows = this.rows;
    if (rows != null) {
      map['rows'] = rows.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

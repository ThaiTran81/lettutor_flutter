import 'Nationality.dart';

class Filters {
  Filters({
    this.specialties,
    this.nationality,
    this.date,
    this.tutoringTimeAvailable,
  });

  Filters.fromJson(dynamic json) {
    specialties =
        json['specialties'] != null ? json['specialties'].cast<String>() : [];
    nationality = json['nationality'] != null
        ? Nationality.fromJson(json['nationality'])
        : null;
    date = json['date'];
    if (json['tutoringTimeAvailable'] != null) {
      tutoringTimeAvailable = [];
      json['tutoringTimeAvailable'].forEach((v) {
        tutoringTimeAvailable?.add(v);
      });
    }
  }

  List<String>? specialties;
  Nationality? nationality;
  DateTime? date;
  List<int>? tutoringTimeAvailable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (specialties != null) {
      map['specialties'] = specialties;
    }
    final nationality = this.nationality;
    if (nationality != null) {
      map['nationality'] = nationality.toJson();
    }
    if (date != null) {
      map['date'] = date;
    }
    if (tutoringTimeAvailable != null) {
      map['tutoringTimeAvailable'] = tutoringTimeAvailable;
    }
    return map;
  }
}

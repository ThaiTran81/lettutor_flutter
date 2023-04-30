import 'EbookInfo.dart';

class Data {
  Data({
    this.count,
    this.rows,
  });

  Data.fromJson(dynamic json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = [];
      json['rows'].forEach((v) {
        rows?.add(EbookInfo.fromJson(v));
      });
    }
  }

  int? count;
  List<EbookInfo>? rows;

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

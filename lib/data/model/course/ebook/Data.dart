import 'EbookInfo.dart';

class Data {
  Data({
    this.count,
    this.ebookList,
  });

  Data.fromJson(dynamic json) {
    count = json['count'];
    if (json['rows'] != null) {
      ebookList = [];
      json['rows'].forEach((v) {
        ebookList?.add(EbookInfo.fromJson(v));
      });
    }
  }

  int? count;
  List<EbookInfo>? ebookList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    final rows = this.ebookList;
    if (rows != null) {
      map['rows'] = rows.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

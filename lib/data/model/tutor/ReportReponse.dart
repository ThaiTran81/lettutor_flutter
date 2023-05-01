import 'ReportData.dart';

class ReportReponse {
  ReportReponse({
    this.message,
    this.data,
  });

  ReportReponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? ReportData.fromJson(json['data']) : null;
  }

  String? message;
  ReportData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    final data = this.data;
    if (data != null) {
      map['data'] = data.toJson();
    }
    return map;
  }
}

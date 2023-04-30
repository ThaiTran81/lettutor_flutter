import 'Data.dart';

class EbookResponse {
  EbookResponse({
    this.message,
    this.data,
  });

  EbookResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? message;
  Data? data;

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

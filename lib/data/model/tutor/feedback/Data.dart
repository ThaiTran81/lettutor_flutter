import 'package:lettutor_thaitran81/data/model/tutor/Feedback.dart';

class Data {
  Data({
    this.count,
    this.feedbacks,
  });

  Data.fromJson(dynamic json) {
    count = json['count'];
    if (json['rows'] != null) {
      feedbacks = [];
      json['rows'].forEach((v) {
        feedbacks?.add(FeedbackData.fromJson(v));
      });
    }
  }

  int? count;
  List<FeedbackData>? feedbacks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    final rows = this.feedbacks;
    if (rows != null) {
      map['rows'] = rows.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

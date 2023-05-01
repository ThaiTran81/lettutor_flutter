class FavoriteTutorResponse {
  FavoriteTutorResponse({
    this.message,
    this.result,
  });

  FavoriteTutorResponse.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'] == 1 ? false : true;
  }

  String? message;
  bool? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['result'] = result;
    return map;
  }
}

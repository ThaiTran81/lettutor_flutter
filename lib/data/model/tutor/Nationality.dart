class Nationality {
  Nationality({
    this.isVietNamese,
    this.isNative,
  });

  Nationality.fromJson(dynamic json) {
    isVietNamese = json['isVietNamese'];
    isNative = json['isNative'];
  }

  bool? isVietNamese;
  bool? isNative;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isVietNamese'] = isVietNamese;
    map['isNative'] = isNative;
    return map;
  }
}

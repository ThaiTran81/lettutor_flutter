class Access {
  Access({
    required this.token,
    this.expires,
  });

  Access.fromJson(dynamic json) {
    token = json['token'];
    expires = json['expires'];
  }

  late String token;
  String? expires;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['expires'] = expires;
    return map;
  }
}

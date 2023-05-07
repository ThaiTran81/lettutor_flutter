class TestPreparation {
  TestPreparation({
    required this.id,
    required this.key,
    this.name,
  });

  TestPreparation.fromJson(dynamic json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
  }

  late int id;
  late String key;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['key'] = key;
    map['name'] = name;
    return map;
  }
}

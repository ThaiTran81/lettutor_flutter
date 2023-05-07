class LearnTopic {
  LearnTopic({
    required this.id,
    required this.key,
    this.name,
  });

  LearnTopic.fromJson(dynamic json) {
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

class WalletInfo {
  WalletInfo({
    required this.id,
    required this.userId,
    required this.amount,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.bonus,
  });

  WalletInfo.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    amount = int.parse(json['amount'] ?? '0')~/100000;
    isBlocked = json['isBlocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bonus = json['bonus'];
  }

  late String id;
  late String userId;
  late int amount;
  late bool isBlocked;
  late String createdAt;
  late String updatedAt;
  late int bonus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['amount'] = amount;
    map['isBlocked'] = isBlocked;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['bonus'] = bonus;
    return map;
  }
}

import 'Access.dart';
import 'Refresh.dart';

class Tokens {
  late Access access;
  late Refresh refresh;

  Tokens({
    required this.access,
    required this.refresh,
  });

  Tokens.fromJson(dynamic json) {
    access = (json['access'] != null ? Access.fromJson(json['access']) : null)!;
    refresh =
        (json['refresh'] != null ? Refresh.fromJson(json['refresh']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (access != null) {
      map['access'] = access.toJson();
    }
    if (refresh != null) {
      map['refresh'] = refresh.toJson();
    }
    return map;
  }
}

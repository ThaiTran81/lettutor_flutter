import 'Tokens.dart';
import 'User.dart';

class UserData {
  late User? user;
  late Tokens? tokens;

  UserData({
    this.user,
    this.tokens,
  });

  UserData.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final user = this.user;
    if (user != null) {
      map['user'] = user.toJson();
    }
    final tokens = this.tokens;
    if (tokens != null) {
      map['tokens'] = tokens.toJson();
    }
    return map;
  }
}

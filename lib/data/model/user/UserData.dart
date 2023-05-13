import 'Tokens.dart';
import 'User.dart';

class UserResponse {
  late UserData? user;
  late Tokens? tokens;

  UserResponse({
    this.user,
    this.tokens,
  });

  UserResponse.fromJson(dynamic json) {
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
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

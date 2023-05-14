import 'Tokens.dart';
import 'User.dart';

class UserResponse {
  late UserData? userData;
  late Tokens? tokens;

  UserResponse({
    this.userData,
    this.tokens,
  });

  UserResponse.fromJson(dynamic json) {
    userData = json['user'] != null ? UserData.fromJson(json['user']) : null;
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final user = this.userData;
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

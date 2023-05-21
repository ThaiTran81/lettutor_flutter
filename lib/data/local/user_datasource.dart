import 'package:lettutor_thaitran81/data/local/utils/SecureStorageUtils.dart';

class UserDatasource {
  static String keyAuthToken = "key_auth_token";
  static String keyName = "key_name";
  static String keyUserId = "user_id";
  static String keyAvatar = "key_avatar";
  static String keyEmail = "key_email";

  static Future<String?> getAuthToken() async {
    return await SecureStorageUtils.getValue(keyAuthToken);
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtils {
  static FlutterSecureStorage? _flutterSecureStorage;

  static String keyAuthToken = "key_auth_token";
  static String keyName = "key_name";
  static String keyUserId = "user_id";
  static String keyAvatar = "key_avatar";
  static String keyEmail = "key_email";

  static FlutterSecureStorage? getInstanse() {
    _flutterSecureStorage ??= const FlutterSecureStorage();

    return _flutterSecureStorage;
  }

  static setValue(String key, String? value) async {
    await getInstanse()?.write(key: key, value: value);
  }

  static Future<String?> getValue(String key) async {
    return await getInstanse()?.read(key: key);
  }

  static deleteKey(String key) async {
    await getInstanse()?.delete(key: key);
  }
}

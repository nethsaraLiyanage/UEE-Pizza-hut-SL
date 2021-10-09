import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth {
  static final storage = new FlutterSecureStorage();

  static Future<void> rememberUser(String id) async {
    await storage.write(key: "user_id", value: id);
  }

  static Future<String> getUserId() async {
    var user_id = await storage.read(key: "user_id");
    return user_id.toString();
  }

  static Future<bool> isLoggedIn() async {
    String user_id = await getUserId();
    if (user_id != null) {
      return false;
    } else {
      return true;
    }
  }
}

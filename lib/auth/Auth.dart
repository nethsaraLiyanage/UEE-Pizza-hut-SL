import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:pizzahut/utils/connection.dart';
import 'package:http/http.dart' as http;
import 'package:pizzahut/model/User.dart';

class Auth {
  static final storage = new FlutterSecureStorage();
    static User user = User('', '', '', '', '');


//Remember user for next login
  static Future<void> rememberUser(String id) async {
    await storage.write(key: "user_id", value: id);
  }

//Get the current user id
  static Future<String> getUserId() async {
    var user_id = await storage.read(key: "user_id");
    return user_id.toString();
  }

//Check if user is previously logged in
  static Future<bool> isLoggedIn() async {
    String user_id = await getUserId();
    if (user_id != null) {
      return false;
    } else {
      return true;
    }
  }

//Get the user profile details
  static Future<User> view() async {
    // User user = User('', '', '', '', '');
    var id = await getUserId();
    print("User ID:" + id);
    var res = await http.get(
        Uri.parse(Connection.baseUrl + "/user/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        });
    var result = await jsonDecode(res.body);
    user.full_name = await result['user']['fullName'];
    user.email = await result['user']['email'];
    user.mobile_number = await result['user']['mobileNumber'];
    user.delivery_address = await result['user']['deliveryAddress'];

    return user;
  }
  



}

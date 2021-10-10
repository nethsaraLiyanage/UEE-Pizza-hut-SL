import 'package:flutter_config/flutter_config.dart';

class Connection {
<<<<<<< HEAD
  static final baseUrl = "http://192.168.1.4:8000/user/login";
=======
  static final baseUrl = "http://"+FlutterConfig.get('IP')+":8000";
>>>>>>> 35a99a17b3fdb52e4b8bb81d80bb733134cc2399
}

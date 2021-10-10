import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:pizzahut/model/Addons.dart';
import 'package:http/http.dart';
import 'dart:developer';

import 'package:pizzahut/model/cart_item.dart';

class HttpServiceCartItem {
  final String getUrl = "http://192.168.1.4:8000/addon";
  final bodyData = jsonEncode({
    
  });

  Future<String> getAddons(CartItem item) async {
    Response res = await post(Uri.parse(getUrl));

    if (res.statusCode == 200) {
      return "data saved";
    } else {
      return "error";
    }
  }
}

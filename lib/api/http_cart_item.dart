import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:pizzahut/model/Addons.dart';
import 'package:http/http.dart';
import 'dart:developer';

import 'package:pizzahut/model/cart_item.dart';

class HttpServiceCartItem {
  final String getUrl = "http://192.168.1.4:8000/product/cart-item";

  Future<String> getAddons(CartItem item) async {
    Response res = await post(Uri.parse(getUrl),
        body: jsonEncode(
            <String, dynamic>{'size': item.size, 'crust': item.crust, "additions" : item.additions, "count" : 1, "totPrice" : 0, "isSelcted" : false}),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'}
            );

    if (res.statusCode == 200) {
      return "data saved";
    } else {
      return "error";
    }
  }
}

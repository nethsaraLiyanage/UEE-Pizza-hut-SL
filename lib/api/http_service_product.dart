import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:pizzahut/model/Product.dart';
import 'package:http/http.dart';
import 'dart:developer';

class HttpServiceProduct {
  final String getUrl = "http://192.168.1.4:8000/product";

  Future<List<Product>> getProduct() async {
    Response res = await get(Uri.parse(getUrl));

    if (res.statusCode == 200) {
      log(res.body);
      List<dynamic> body = jsonDecode(res.body);

      List<Product> products =
          body.map((dynamic item) => Product.fromJson(item)).toList();

      return products;
    } else {
      debugPrint('error');
      log('cant fecth data');
      throw "cant get products";
    }
  }
}

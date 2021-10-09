import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:pizzahut/model/Product.dart';
import 'package:http/http.dart';
import 'dart:developer';

class HttpServiceProduct {
  final String getUrl = "http://b638-2402-4000-2380-b48e-c0da-447a-e0c3-1608.ngrok.io/product";

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

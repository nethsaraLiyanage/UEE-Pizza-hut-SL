import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:pizzahut/model/Product.dart';
import 'package:http/http.dart';
import 'dart:developer';
import 'package:flutter_config/flutter_config.dart';

class HttpServiceSearch {
  final String getUrl = "http://"+FlutterConfig.get('IP')+":8000/product/search/";

  Future<List<Product>> getSearchProduct(String searchString) async {
    Response res = await get(Uri.parse("http://"+FlutterConfig.get('IP')+":8000/product/search/"+searchString));
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

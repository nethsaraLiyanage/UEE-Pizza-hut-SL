import 'package:flutter/foundation.dart';

class Product {
  late final String itemTitle;
  late final String description;
  late final int price;
  late final String imageUrl;
  late final List additions;
  late final String mini_desc;

  Product(
      {required this.itemTitle,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.additions,
      required this.mini_desc,});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        itemTitle: json['itemTitle'],
        mini_desc: json['mini_desc'],
        description: json['description'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        additions: ['additions'] as List);
  }
}

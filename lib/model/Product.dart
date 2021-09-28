import 'package:flutter/foundation.dart';

class Product {
  late final String itemTitle;
  late final String description;
  late final int price;
  late final String imageUrl;
  late final List additions;

  Product(
      {required this.itemTitle,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.additions});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        itemTitle: json['itemTitle'],
        description: json['description'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        additions: ['additions'] as List);
  }
}

import 'package:flutter/material.dart';

class Product {
  final String category;
  final String label;
  final List<double> sizes;
  final List<AssetImage> images;
  final int price;

  Product(this.category, this.label, this.sizes, this.images, this.price);
}

List<Product> catalog = [
  Product(
      "Sneakers",
      "Nike Dunk Low (GS)",
      [35.5, 36, 36.5, 37.5],
      [
        const AssetImage("assets/images/nikedunklowgs.jpg"),
        const AssetImage("assets/images/nikedunklowgs1.jpg"),
        const AssetImage("assets/images/nikedunklowgs2.jpg")
      ],
      15690),
];

import 'package:flutter/material.dart';
import 'package:test_project/api/data/product.dart';
import 'product_form.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ProductForm(product: product);
  }
}

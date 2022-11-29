import 'package:flutter/widgets.dart';
import 'package:test_project/design/custom_icons.dart';

class Category {
  final String label;
  final IconData icon;
  bool isSelected = false;

  Category(this.label, this.icon) {
    isSelected = false;
  }
}

List<Category> categories = [
  Category("Sneakers", CustomIcons.sneakers),
  Category("Pants", CustomIcons.pants),
  Category("Outerwear", CustomIcons.jacket),
  Category("Hoodie", CustomIcons.hoodie),
  Category("T-shirt", CustomIcons.shirt),
  Category("Track suit", CustomIcons.sportWear),
];

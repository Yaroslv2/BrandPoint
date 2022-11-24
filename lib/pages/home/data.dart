import 'package:flutter/material.dart';

import 'package:test_project/design/custom_icons.dart';

class Category {
  final label;
  final icon;

  Category(this.label, this.icon);
}

List<Category> categories = [
  Category("Sneakers", CustomIcons.sneakers),
  Category("Pants", CustomIcons.sneakers),
  Category("Outerwear", CustomIcons.sneakers),
  Category("Hoodie", CustomIcons.sneakers),
  Category("T-shirt", CustomIcons.sneakers),
  Category("Track suit", CustomIcons.sneakers),
];

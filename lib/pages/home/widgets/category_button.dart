import 'package:flutter/material.dart';
import '../data.dart';
import 'package:test_project/design/custom_icons.dart';

Widget categoryButton(category) {
  return SizedBox(
    height: 60,
    width: 100,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 238, 237, 237),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(category.icon, color: Colors.black, size: 40),
          Text(category.label)
        ],
      ),
    ),
  );
}

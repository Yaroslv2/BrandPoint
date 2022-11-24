import 'package:flutter/material.dart';
import '../login.dart';

Widget preLogin(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      logButton(context, "Sign in", Colors.black, Colors.white),
      const Padding(padding: EdgeInsets.only(bottom: 10)),
      logButton(context, "Create Account", Colors.white, Colors.black)
    ],
  );
}

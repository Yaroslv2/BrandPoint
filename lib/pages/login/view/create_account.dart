import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _hintTextStyle =
    GoogleFonts.openSans(color: Colors.black, fontWeight: FontWeight.w400);

Widget createAccount(context) {
  return Column(
    children: [
      Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  hintText: "e-mail",
                  hintStyle: _hintTextStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            TextFormField(),
            TextFormField()
          ],
        ),
      )
    ],
  );
}

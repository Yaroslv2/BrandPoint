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
              obscureText: true,
              style: GoogleFonts.openSans(
                  color: Colors.black, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
                hintText: "Password",
                hintStyle: GoogleFonts.openSans(
                    color: Colors.grey, fontWeight: FontWeight.w400),
              ),
            ),
            TextFormField(),
            TextFormField()
          ],
        ),
      )
    ],
  );
}

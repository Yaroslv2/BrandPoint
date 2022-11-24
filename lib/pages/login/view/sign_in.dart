import 'package:flutter/material.dart';
import '../login.dart';
import 'package:google_fonts/google_fonts.dart';

Widget signIn(context) {
  return Column(
    children: [
      Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) =>
                  !value!.contains('@') || !value.contains('.')
                      ? "Input the correct e-mail"
                      : null,
              style: GoogleFonts.openSans(
                  color: Colors.black, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
                hintText: "E-mail",
                hintStyle: GoogleFonts.openSans(
                    color: Colors.grey, fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 7.5)),
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            MaterialButton(
                color: Colors.white,
                height: 55,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text("Sign in",
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                onPressed: () {})
          ],
        ),
      ),
      const Padding(padding: EdgeInsets.only(top: 200)),
      logButton(context, "Go back", Colors.white, Colors.black)
    ],
  );
}

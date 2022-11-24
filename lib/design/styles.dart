import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final mainTextStyleBlack =
    GoogleFonts.openSans(color: Colors.black, fontWeight: FontWeight.w400);

final mainTextStyleWhite =
    GoogleFonts.openSans(color: Colors.white, fontWeight: FontWeight.w400);

class LoginStyles {
  final formHintTextStyle =
      GoogleFonts.openSans(color: Colors.black, fontWeight: FontWeight.w400);
  final formBorders = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none);
  final Text logo = Text("BRANDPOINT",
      style: GoogleFonts.alfaSlabOne(color: Colors.white, fontSize: 44));
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginStyles {
  final formHintTextStyle =
      GoogleFonts.openSans(color: Colors.black, fontWeight: FontWeight.w400);
  final formBorders = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none);
  final Text logo = Text("BRANDPOINT",
      style: GoogleFonts.alfaSlabOne(color: Colors.white, fontSize: 44));
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/pages/cubit/login/login_cubit.dart';

Widget logButton(context, label, textColor, buttonColor) {
  return MaterialButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    height: 55,
    color: buttonColor,
    minWidth: double.infinity,
    child: Text(
      label,
      style: GoogleFonts.openSans(
          color: textColor, fontSize: 20, fontWeight: FontWeight.w600),
    ),
    onPressed: () {
      if (label == "Sign in") {
        BlocProvider.of<LoginCubit>(context).signIn();
      } else if (label == "Create Account") {
        BlocProvider.of<LoginCubit>(context).createAccount();
      } else if (label == "Go back") {
        BlocProvider.of<LoginCubit>(context).goBack();
      }
    },
  );
}

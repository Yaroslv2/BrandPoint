import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/api/user_api/api.dart';
import 'package:test_project/design/styles.dart';

import '../cubit/login_cubit.dart';
import '../login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/loginpage.jpg"),
        fit: BoxFit.cover,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LoginStyles().logo,
          BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginInitial || state is LoginPreLogin) {
                  return preLoginCase(context);
                } else if (state is LoginSign) {
                  return loginCase(context);
                } else if (state is LoginCreatNew) {
                  return createNewCase(context);
                } else {
                  return preLoginCase(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget preLoginCase(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      logButton(context, "Sign in", Colors.black, Colors.white),
      const Padding(padding: EdgeInsets.only(bottom: 10)),
      logButton(context, "Create Account", Colors.white, Colors.black)
    ],
  );
}

Widget loginCase(context) {
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

Widget createNewCase(context) {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  return Column(
    children: [
      Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: email,
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
              controller: password,
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 7.5)),
            TextFormField(
              controller: username,
              obscureText: true,
              style: GoogleFonts.openSans(
                  color: Colors.black, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
                hintText: "Username",
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
                child: Text("Create Account",
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                onPressed: () {
                  postUser(email.text, password.text, username.text);
                })
          ],
        ),
      ),
      Padding(padding: EdgeInsets.only(top: 200)),
      logButton(context, "Go back", Colors.white, Colors.black)
    ],
  );
}

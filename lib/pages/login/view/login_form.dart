import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/login_cubit.dart';
import '../pre_login.dart';

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
          Text(
            "BRANDPOINT",
            style: GoogleFonts.alfaSlabOne(color: Colors.white, fontSize: 44),
          ),
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
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: GoogleFonts.openSans(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            const BorderSide(width: 2, color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            const BorderSide(width: 2.4, color: Colors.black))),
              ),
            ),
          ],
        ),
      ),
      const Padding(padding: EdgeInsets.only(top: 30)),
      logButton(context, "Go back", Colors.white, Colors.black)
    ],
  );
}

Widget createNewCase(context) {
  return Column(
    children: [logButton(context, "Go back", Colors.white, Colors.black)],
  );
}

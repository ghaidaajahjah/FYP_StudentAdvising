import 'package:flutter/material.dart';
import 'package:student_advising_app/screens/authenticate/forgot_password.dart';
import 'package:student_advising_app/screens/authenticate/register.dart';
import 'package:student_advising_app/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool ShowSignIn = true;
  void toggleView() {
    setState(() => ShowSignIn = !ShowSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (ShowSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}

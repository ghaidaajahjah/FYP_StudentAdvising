import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_advising_app/models/user.dart';
import 'package:student_advising_app/screens/authenticate/authenticate.dart';
import 'package:student_advising_app/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    //return either authenticate or home widget

    if (user == null) {
      return Authenticate();
    } else {
      print(user.lastName);
      return Home();
    }
  }
}

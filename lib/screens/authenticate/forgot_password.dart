import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_advising_app/shared/constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  bool success = false;
  bool error = false;

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      setState(() {
        success = true;
        error = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        success = false;
        error = true;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[200],
        elevation: 0.0,
        title: Text(
          "Reset Password",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            TextFormField(
              validator: (value) =>
                  value!.isEmpty ? 'Enter an email please' : null,
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
              decoration: textInputDecoration.copyWith(
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            if (error == true)
              Center(
                  child: Text("Email not found!",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold))),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                passwordReset();
              },
              child: Text(
                'Reset',
                style: TextStyle(fontSize: 18),
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(17),
                  backgroundColor: Colors.indigo[400],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            SizedBox(height: 10),
            if (success == true)
              Center(
                  child: Text("Success! Please check your email.",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold))),
          ]),
        ),
      ),
    );
  }
}

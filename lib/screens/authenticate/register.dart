// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_advising_app/shared/loading.dart';
import '../../services/auth.dart';
import '../../shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.indigo[200],
              elevation: 0.0,
              title: Text("Sign up"),
              actions: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Sign in'),
                    style: TextButton.styleFrom(foregroundColor: Colors.white)),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
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
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) => value!.length < 6
                            ? ' The password should be at least 6 characters '
                            : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _authService
                                .registerWithEmailAndPassword(email, password);

                            if (result == null) {
                              setState(() {
                                error = 'please enter a valid email';
                                loading = false;
                              });
                              print(error);
                            } else {
                              print('Something is wrong');
                            }
                          }
                        },
                        child: Text(
                          'Register',
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
                      SizedBox(height: 12),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )
                    ]),
              ),
            ),
          );
  }
}

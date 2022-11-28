import 'package:flutter/material.dart';
import 'package:student_advising_app/models/user.dart';
import 'package:student_advising_app/services/auth.dart';
import 'package:student_advising_app/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        title: Text('Student Advising App'),
        backgroundColor: Colors.indigo[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              // ignore: prefer_const_constructors
              style: TextButton.styleFrom(
                foregroundColor: Colors.indigo[200],
              ),
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout')),
        ],
      ),
    );
  }
}

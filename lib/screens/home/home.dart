// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_advising_app/models/user.dart';
import 'package:student_advising_app/screens/map/mapScreen.dart';
import 'package:student_advising_app/screens/profile/profilePicScreen.dart';
import 'package:student_advising_app/screens/wrapper.dart';
import 'package:student_advising_app/screens/chat/chatList.dart';
import 'package:student_advising_app/services/auth.dart';
import 'package:student_advising_app/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    final String profilePic = user?.profilePic as String;
    return Scaffold(
        backgroundColor: Colors.indigo[200],
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: Colors.indigo[400],
          elevation: 0.0,
          leading:
              Image(image: NetworkImage(profilePic), width: 20, height: 20),
          actions: <Widget>[
            TextButton.icon(
                // ignore: prefer_const_constructors
                style: TextButton.styleFrom(
                  foregroundColor: Colors.indigo[200],
                ),
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: const Icon(Icons.arrow_circle_right_outlined),
                label: const Text('')),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Welcome to \n Student Advising",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    ConstrainedBox(
                        constraints: const BoxConstraints(
                            minHeight: 120,
                            maxHeight: 120,
                            minWidth: 120,
                            maxWidth: 120),
                        child: Container(
                            decoration:
                                BoxDecoration(color: Colors.indigo[400]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.edit_calendar_rounded,
                                    size: 80, color: Colors.white),
                                const Text("Schedule",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ))),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    ConstrainedBox(
                        constraints: const BoxConstraints(
                            minHeight: 120,
                            maxHeight: 120,
                            minWidth: 120,
                            maxWidth: 120),
                        child: Container(
                            decoration:
                                BoxDecoration(color: Colors.indigo[400]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.chat,
                                    size: 80, color: Colors.white),
                                const Text("Chats",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ))),
                  ],
                )
              ]),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    ConstrainedBox(
                        constraints: const BoxConstraints(
                            minHeight: 120,
                            maxHeight: 120,
                            minWidth: 120,
                            maxWidth: 120),
                        child: Container(
                            decoration:
                                BoxDecoration(color: Colors.indigo[400]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.thumb_up,
                                    size: 80, color: Colors.white),
                                const Text("Course Feedback",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ))),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    ConstrainedBox(
                        constraints: const BoxConstraints(
                            minHeight: 120,
                            maxHeight: 120,
                            minWidth: 120,
                            maxWidth: 120),
                        child: Container(
                            decoration:
                                BoxDecoration(color: Colors.indigo[400]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.book,
                                    size: 80, color: Colors.white),
                                const Text("Course Planning",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ))),
                  ],
                )
              ]),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    ConstrainedBox(
                        constraints: const BoxConstraints(
                            minHeight: 120,
                            maxHeight: 120,
                            minWidth: 120,
                            maxWidth: 120),
                        child: Container(
                            decoration:
                                BoxDecoration(color: Colors.indigo[400]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.work,
                                    size: 80, color: Colors.white),
                                const Text("Career Planning",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ))),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    ConstrainedBox(
                        constraints: const BoxConstraints(
                            minHeight: 120,
                            maxHeight: 120,
                            minWidth: 120,
                            maxWidth: 120),
                        child: Container(
                            decoration:
                                BoxDecoration(color: Colors.indigo[400]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.meeting_room,
                                    size: 80, color: Colors.white),
                                const Text("Meetings",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ))),
                  ],
                )
              ]),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return profilePicScreen();
                  }));
                },
                child: Text("Profile",
                    style: TextStyle(
                        backgroundColor: Colors.indigo[400],
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MapScreen();
                  }));
                },
                child: Text("Campus Guide",
                    style: TextStyle(
                        backgroundColor: Colors.indigo[400],
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ));
  }
}

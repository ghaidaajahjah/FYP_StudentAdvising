import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_advising_app/services/database.dart';
import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  StreamController<MyUser?> userStreamController = StreamController<MyUser?>();

  AuthService() {
    _auth.authStateChanges().listen((event) async {
      MyUser? myUser = await _userFromFirebaseUser(event);
      userStreamController.sink.add(myUser);
    });
  }
  //create user object based on firebase user
  Future<MyUser?> _userFromFirebaseUser(User? user) async {
    if (user == null) {
      return null;
    } else {
      return await Database().getUser(user.uid);
    }
  }

  //auth change user stream
  Stream<MyUser?> get user {
    return userStreamController.stream;
  }

  //sign in with email and pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;

      print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and pass
  Future<MyUser?> registerWithEmailAndPassword(
      MyUser myUser, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);
      User? user = credential.user;
      myUser.uid = user?.uid;
      print(user);
      return myUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

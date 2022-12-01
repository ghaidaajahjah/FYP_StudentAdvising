import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class Database {
  final userCollection =
      FirebaseFirestore.instance.collection("userCollection");

  Future<void> updateUserData(MyUser user) async {
    userCollection.doc(user.uid).set({
      "email": user.email,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "major": user.major,
      "profilePic": user.profilePic,
      "isAdvisor": user.isADvisor,
    });
  }

  MyUser mapUser(DocumentSnapshot snapshot) {
    return MyUser(
        email: snapshot.data().toString().contains('email')
            ? snapshot.get('email')
            : '',
        uid: snapshot.id,
        firstName: snapshot.data().toString().contains('firstName')
            ? snapshot.get('firstName')
            : '',
        lastName: snapshot.data().toString().contains('lastName')
            ? snapshot.get('lastName')
            : '',
        major: snapshot.data().toString().contains('major')
            ? snapshot.get('major')
            : '',
        profilePic: snapshot.data().toString().contains('profilePic')
            ? snapshot.get('profilePic')
            : '',
        isADvisor: snapshot.data().toString().contains('isAdvisor')
            ? snapshot.get('isAdvisor')
            : false);
  }

  Future<MyUser> getUser(String uid) async {
    DocumentSnapshot data = await userCollection.doc(uid).get();
    return mapUser(data);
  }
}

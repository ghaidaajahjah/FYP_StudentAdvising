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
      "isAdvisor": user.isADvisor,
    });
  }

  MyUser mapUser(DocumentSnapshot snapshot) {
    return MyUser(
        email: snapshot.get("email"),
        uid: snapshot.id,
        firstName: snapshot.get("firstName"),
        lastName: snapshot.get("lastName"),
        major: snapshot.get("major"),
        isADvisor: snapshot.get("isAdvisor"));
  }

  Future<MyUser> getUser(String uid) async {
    DocumentSnapshot data = await userCollection.doc(uid).get();
    return mapUser(data);
  }
}

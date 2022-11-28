import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class Database {
  final userCollection =
      FirebaseFirestore.instance.collection("userCollection");

  Future<void> updateUserData(MyUser user) async {
    userCollection.doc(user.uid).set({
      "email": user.email,
      "isAdvisor": user.isADvisor,
    });
  }

  MyUser mapUser(DocumentSnapshot snapshot) {
    return MyUser(
        email: snapshot.get("email"),
        uid: snapshot.id,
        isADvisor: snapshot.get("isAdvisor"));
  }

  Future<MyUser> getUser(String uid) async {
    DocumentSnapshot data = await userCollection.doc(uid).get();
    return mapUser(data);
  }
}

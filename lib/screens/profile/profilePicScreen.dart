import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_advising_app/models/user.dart';
import 'package:student_advising_app/services/database.dart';

class profilePicScreen extends StatefulWidget {
  @override
  State<profilePicScreen> createState() => _profilePicScreenState();
}

class _profilePicScreenState extends State<profilePicScreen> {
  String picURL = " ";

  Future pickUploadImage(MyUser? user) async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 75);

    if (image?.name != null) {
      String userUid = user!.uid as String;
      Reference ref =
          FirebaseStorage.instance.ref().child("profilePics/" + userUid);
      print("path: " + image!.path);
      await ref.putFile(File(image.path));
      ref.getDownloadURL().then((value) async {
        print("value: " + value);
        setState(() {
          picURL = value;
        });
        user.profilePic = value;
        await Database().updateUserData(user);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[200],
        elevation: 0.0,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: Container(
              child: Column(children: [
        SizedBox(height: 10),
        Image(
            image: NetworkImage(picURL == " " ? user!.profilePic! : picURL),
            width: 200,
            height: 200),
        SizedBox(height: 10),
        Text("${user?.firstName} ${user?.lastName}"),
        TextButton(
            onPressed: () async {
              await pickUploadImage(user);
              setState(() {});
            },
            child: Text("Change Avatar"))
      ]))),
    );
  }
}

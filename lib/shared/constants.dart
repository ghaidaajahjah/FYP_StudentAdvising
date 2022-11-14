import 'package:flutter/material.dart';

dynamic textInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 20.0),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.indigo.shade200, width: 2)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.indigo.shade400,
        width: 2,
      )),
  fillColor: Colors.indigo[200],
  filled: true,
);

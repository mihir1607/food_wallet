import 'package:flutter/material.dart';

class User {
  String username;
  String email;
  String phone;
  String password;

  User({
    this.username, // add @required after modifying the form
    @required this.email,
    this.phone, // add @required after modifyinf the form
    @required this.password,
  });
}

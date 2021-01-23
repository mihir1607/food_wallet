import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../providers/user.dart';

class ForgotPassword extends StatelessWidget {
  static const routeName = '/forgetpassword_page';
  static const String _title = 'Forgot Password';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final _button = FocusNode();

  var newUser = User(
    email: '',
    password: '',
    phone: '',
    username: '',
  );

  void _saveForm() {
    _formKey.currentState.save();
    const url = 'http://10.0.2.2:3000';
    var response = json.encode({
      'email': newUser.email,
    });
    http
        .post(url + '/forgot',
            headers: {
              'content-type': 'application/json',
            },
            body: response)
        .then((value) => print(json.decode(value.body)));
    print(response);
    // print(newUser.email);
    // print(newUser.password);
    // print(newUser.username);
    // print(newUser.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (value) {
              newUser = User(
                email: value,
                password: newUser.password,
                phone: newUser.phone,
                username: newUser.username,
              );
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: FlatButton(
                color: Colors.blue,
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    _saveForm();
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

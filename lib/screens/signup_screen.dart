import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../providers/user.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup_page';

  SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();
  final _passwordkey = FocusNode();
  final _phonekey = FocusNode();
  final _button = FocusNode();
  final _emailkey = FocusNode();
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
      'username': newUser.username,
      'phone': newUser.phone,
      'password': newUser.password,
    });
    http
        .post(
          url + '/register',
          headers: {
            'content-type': 'application/json',
          },
          body: response,
        )
        .then((value) => print(json.decode(value.body)));
    // print(newUser.email);
    // print(newUser.password);
    //print(newUser.username);
    //print(newUser.phone);
    print(response);
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 40,
//                       bottom:40,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your username',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_emailkey);
                  },
                  onSaved: (value) {
                    newUser = User(
                      email: newUser.email,
                      password: newUser.password,
                      phone: newUser.phone,
                      username: value,
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 40,
//                       bottom:40,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailkey,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordkey);
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
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 40,
//                       bottom:40,
                ),
                child: TextFormField(
                  obscureText: _obscureText,
                  focusNode: _passwordkey,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: _obscureText
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: _toggle,
                    ),
                    hintText: 'Enter Password',
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_phonekey);
                  },
                  onSaved: (value) {
                    newUser = User(
                      email: newUser.email,
                      password: value,
                      phone: newUser.phone,
                      username: newUser.username,
                    );
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 40,
//                       bottom:40,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  focusNode: _phonekey,
                  decoration: const InputDecoration(
                    hintText: 'Enter phone number',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_button);
                  },
                  onSaved: (value) {
                    newUser = User(
                      email: newUser.email,
                      password: newUser.password,
                      phone: value,
                      username: newUser.username,
                    );
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: RaisedButton(
                    focusNode: _button,
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        _saveForm();
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

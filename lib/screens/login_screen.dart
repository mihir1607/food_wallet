import 'dart:convert';

import 'package:flutter/material.dart';

import './hotel_index.dart';
import 'package:http/http.dart' as http;

import '../providers/user.dart';
import './forgot_password.dart';

class LoginScreen extends StatelessWidget {
  static const String _title = 'Login Page';
  static const routeName = '/login_page';

  @override
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
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();
  final _emailkey = FocusNode();
  final _passwordkey = FocusNode();
  final _button = FocusNode();

  var newUser = User(
    email: '',
    password: '',
    phone: '',
    username: '',
  );

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _saveForm() {
    _formKey.currentState.save();
    const url = 'http://10.0.2.2:3000';
    var response = json.encode({
      'email': newUser.email,
      'password': newUser.password,
    });
    http
        .post(
      url + '/login',
      headers: {
        'content-type': 'application/json',
      },
      body: response,
    )
        .then((value) {
      // print(json.decode[token]);
      print(json.decode((value.body)));
      print(json.decode('${value.statusCode}'));
      if (json.decode(value.body)) {
        Navigator.of(context).pushNamed(HotelIndex.routeName);
      }
    });
    // print(response);
    // if (response == "Login Successful ") {
    //   Navigator.of(context).pushNamed(HotelIndex.routeName);
    // }
    // print(newUser.email);
    // print(newUser.password);
    // print(newUser.username);
    // print(newUser.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 30),
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
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 30),
                child: TextFormField(
                  obscureText: _obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: _passwordkey,
                  decoration: InputDecoration(
                    hintText: 'password',
                    suffixIcon: IconButton(
                        icon: _obscureText
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: _toggle),
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
                      password: value,
                      phone: newUser.phone,
                      username: newUser.username,
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 30),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      focusNode: _button,
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState.validate()) {
                          _saveForm();
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Text(
                  'Forgot Password ?',
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(ForgotPassword.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

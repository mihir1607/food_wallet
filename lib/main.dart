import 'package:flutter/material.dart';

import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/forgot_password.dart';
import './screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connaught App',
      home: WelcomeScreen(),
      routes: {
        SignupScreen.routeName: (ctx) => SignupScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        ForgotPassword.routeName: (ctx) => ForgotPassword(),
      },
    );
  }
}

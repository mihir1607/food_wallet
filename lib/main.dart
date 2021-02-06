import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/forgot_password.dart';
import './screens/welcome_screen.dart';
import './screens/hotel_index.dart';
import './providers/hotels.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HotelList(),
        ),
      ],
      child: MaterialApp(
        title: 'Connaught App',
        home: WelcomeScreen(),
        // home: HotelIndex(),
        routes: {
          SignupScreen.routeName: (ctx) => SignupScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          ForgotPassword.routeName: (ctx) => ForgotPassword(),
          HotelIndex.routeName: (ctx) => HotelIndex(),
        },
      ),
    );
  }
}

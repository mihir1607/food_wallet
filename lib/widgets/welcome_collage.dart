import 'package:flutter/material.dart';

import '../screens/signup_screen.dart';
import '../screens/login_screen.dart';

class WelcomeCollage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.1, right: width * 0.09),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome There!',
                style: TextStyle(
                    fontSize: height * 0.05, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.05, bottom: height * 0.03),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/dish-1.png',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fitWidth,
                          height: height * 0.19,
                          width: width * 0.45,
                        ),
                        SizedBox(
                          height: height * 0.0005,
                        ),
                        Image.asset(
                          'assets/images/dish-3.png',
                          fit: BoxFit.fitWidth,
                          height: height * 0.29,
                          width: width * 0.45,
                          alignment: Alignment.bottomCenter,
                        )
                      ],
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/dish-2.png',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fitWidth,
                          height: height * 0.35,
                          width: width * 0.34,
                        ),
                        SizedBox(
                          height: height * 0.0005,
                        ),
                        Image.asset(
                          'assets/images/dish-4.png',
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter,
                          height: height * 0.13,
                          width: width * 0.34,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    minWidth: width * 0.35,
                    height: height * 0.07,
                    child: FlatButton(
                      color: Colors.green,
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        // print('Hello');
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                    ),
                  ),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    minWidth: width * 0.35,
                    height: height * 0.07,
                    child: FlatButton(
                      color: Colors.grey,
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignupScreen.routeName);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Image.asset(
            'assets/images/bottom-image.png',
            alignment: Alignment.bottomLeft,
            height: height * 0.1,
          ),
        ),
      ],
    );
  }
}

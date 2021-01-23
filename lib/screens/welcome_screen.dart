import 'package:flutter/material.dart';
import '../widgets/welcome_collage.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        flexibleSpace: Image.asset(
          'assets/images/top-image.png',
          alignment: Alignment.topLeft,
        ),
      ),
      body: WelcomeCollage(),
    );
  }
}

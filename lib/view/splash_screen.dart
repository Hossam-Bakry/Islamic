import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const String route = 'splash screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/splashscreen.png',
            ),
          ),
        ),
      ),
    );
  }
}

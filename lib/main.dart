import 'package:flutter/material.dart';
import 'package:islamic/splash_screen.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyThemeData {
  static const Color primaryColor = Color.fromARGB(255, 183, 147, 95);
  static final ThemeData lightThem = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islamic',
      themeMode: ThemeMode.light,
      theme: MyThemeData.lightThem,
      routes: {
        HomePage.route: (BuildContext context) => HomePage(),
        SplashPage.route: (BuildContext context) => SplashPage(),
      },
      initialRoute: HomePage.route,
    );
  }
}

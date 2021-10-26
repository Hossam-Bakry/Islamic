import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islamic',
      theme: ThemeData(),
      routes: {
        HomePage.route: (BuildContext context) => HomePage(),
      },
      initialRoute: HomePage.route,
    );
  }
}

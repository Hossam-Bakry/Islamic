import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/View/splash_screen.dart';
import 'package:islamic/view/hadeth_screen/hadeth_details_scren.dart';
import 'package:islamic/view/home_page.dart';
import 'package:islamic/view/quran_screen/SuraDetails_screen.dart';

void main() {
  runApp(MyApp());
}

class MyThemeData {
  static const Color primaryColor = Color.fromARGB(255, 183, 147, 95);

  static final ThemeData lightThem = ThemeData(
    textTheme: TextTheme(
      headline4: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Arabic',
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Arabic',
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Arabic',
      ),
    ),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Arabic',
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Arabic',
      ),
      selectedIconTheme: IconThemeData(size: 25.0),
      unselectedIconTheme: IconThemeData(size: 20.0),
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
        SuraDetailsScreen.routeName: (BuildContext context) =>
            SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (BuildContext context) =>
            HadethDetailsScreen(),
      },
      initialRoute: HomePage.route,
    );
  }
}

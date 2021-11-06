import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/View/splash_screen.dart';
import 'package:islamic/core/local/cashe_helper.dart';
import 'package:islamic/core/provider/AppProvider.dart';
import 'package:islamic/view/hadeth_screen/hadeth_details_scren.dart';
import 'package:islamic/view/home_page.dart';
import 'package:islamic/view/quran_screen/SuraDetails_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CasheHelper.init();
  bool? isDark = CasheHelper.getData(key: 'isDark');

  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: MyApp(isDark),
    ),
  );
}

class MyThemeData {
  static const Color primaryColor = Color.fromARGB(255, 183, 147, 95);
  static const Color primaryDarkColor = Color.fromARGB(255, 20, 26, 46);
  static const Color accentDarkColor = Color.fromARGB(255, 250, 204, 29);

  static final ThemeData lightThem = ThemeData(
    textTheme: TextTheme(
      headline4: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Arabic',
        color: Colors.black54,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Arabic',
        color: Colors.black,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Arabic',
        color: Colors.black,
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
  static final ThemeData darkThem = ThemeData(
    textTheme: TextTheme(
      headline4: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Arabic',
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Arabic',
        color: Colors.white,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Arabic',
        color: Colors.white,
      ),
    ),
    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Arabic',
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryDarkColor,
      selectedItemColor: accentDarkColor,
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
  final bool? isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islamic',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appthemeMode,
      theme: MyThemeData.lightThem,
      darkTheme: MyThemeData.darkThem,
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

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/core/provider/AppProvider.dart';
import 'package:islamic/main.dart';
import 'package:islamic/view/hadeth_screen/hadeth_screen.dart';
import 'package:islamic/view/quran_screen/quran_screen.dart';
import 'package:islamic/view/radio_screen/radio_screen.dart';
import 'package:islamic/view/sebha_screen/sebha_screen.dart';
import 'package:islamic/view/setting_screen/setting_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String route = 'home page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screen = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Stack(
      children: [
        Image.asset(
          provider.isDarkMode()
              ? 'assets/images/mainBackground_dark.png'
              : 'assets/images/mainBackground.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
            ),
          ),
          body: screen[currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
              child: BottomNavigationBar(
                selectedIconTheme: IconThemeData(size: 30.0),
                unselectedIconTheme: IconThemeData(size: 25.0),
                currentIndex: currentIndex,
                onTap: onClick,
                backgroundColor: MyThemeData.primaryColor,
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Arabic',
                ),
                type: BottomNavigationBarType.shifting,
                items: [
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 45,
                      child: ImageIcon(
                        AssetImage('assets/images/ic_moshaf.png'),
                      ),
                    ),
                    label: AppLocalizations.of(context)!.quran,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_hadeth.png'),
                    ),
                    label: AppLocalizations.of(context)!.hadeth,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_sebha.png'),
                    ),
                    label: AppLocalizations.of(context)!.tasbeh,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/images/ic_radio.png'),
                    ),
                    label: AppLocalizations.of(context)!.radio,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.setting,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onClick(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

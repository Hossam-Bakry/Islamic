import 'package:flutter/material.dart';
import 'package:islamic/hadeth_screen.dart';
import 'package:islamic/main.dart';
import 'package:islamic/quran_screen.dart';
import 'package:islamic/radio_screen.dart';
import 'package:islamic/sebha_screen.dart';

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
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/mainBackground.png'),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'إسلامي',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
          ),
          body: screen[currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyThemeData.primaryColor,
            ),
            child: BottomNavigationBar(
              selectedIconTheme: IconThemeData(size: 35.0),
              unselectedIconTheme: IconThemeData(size: 30.0),
              currentIndex: currentIndex,
              onTap: onClick,
              backgroundColor: MyThemeData.primaryColor,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
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
                  label: 'القرآن',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_hadeth.png'),
                  ),
                  label: 'الأحاديث',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_sebha.png'),
                  ),
                  label: 'التسبيح',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_radio.png'),
                  ),
                  label: 'الراديو',
                ),
              ],
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

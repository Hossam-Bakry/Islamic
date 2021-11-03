import 'package:flutter/material.dart';
import 'package:islamic/main.dart';
import 'package:islamic/view/hadeth_screen/hadeth_screen.dart';
import 'package:islamic/view/quran_screen/quran_screen.dart';
import 'package:islamic/view/radio_screen/radio_screen.dart';
import 'package:islamic/view/sebha_screen/sebha_screen.dart';

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
        Image.asset(
          'assets/images/mainBackground.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'إسلامي',
            ),
          ),
          body: screen[currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyThemeData.primaryColor,
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

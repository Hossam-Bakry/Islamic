import 'package:flutter/material.dart';
import 'package:islamic/core/provider/AppProvider.dart';
import 'package:islamic/main.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
  ];

  double rotate = 0;

  int counter = 0;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<AppProvider>(context);
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: size.height / 10),
          Stack(
            alignment: Alignment(0.2, -2.3),
            children: [
              Image.asset(
                provider.isDarkMode()
                    ? 'assets/images/head_seb7a_dark.png'
                    : 'assets/images/head_seb7a.png',
              ),
              InkWell(
                onTap: onClick,
                highlightColor: Color.fromRGBO(236, 236, 236, 1.0),
                splashColor: Color.fromRGBO(236, 236, 236, 1.0),
                customBorder: CircleBorder(),
                child: Transform.rotate(
                  angle: rotate,
                  child: Image.asset(
                    provider.isDarkMode()
                        ? 'assets/images/body_seb7a_dark.png'
                        : 'assets/images/body_seb7a.png',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: provider.isDarkMode() ? Colors.white : Colors.black,
                ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            width: 70.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: provider.isDarkMode()
                  ? MyThemeData.primaryDarkColor.withOpacity(0.8)
                  : MyThemeData.primaryColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text(
              '$counter',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: provider.isDarkMode() ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          Container(
            alignment: Alignment.center,
            width: 140.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: provider.isDarkMode()
                  ? MyThemeData.accentDarkColor
                  : MyThemeData.primaryColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text(
              azkar[currentIndex],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: provider.isDarkMode() ? Colors.black : Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void onClick() {
    counter++;
    rotate--;
    setState(() {});
    if (counter == 34) {
      currentIndex++;
      counter = 0;
      setState(() {});
    }
    if (currentIndex > azkar.length - 1) {
      currentIndex = 0;
      setState(() {});
    }
  }
}

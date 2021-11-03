import 'package:flutter/material.dart';
import 'package:islamic/main.dart';

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

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: size.height / 10),
          Stack(
            alignment: Alignment(0.2, -2.3),
            children: [
              Image.asset('assets/images/head_seb7a.png'),
              InkWell(
                onTap: onClick,
                highlightColor: Color.fromRGBO(236, 236, 236, 1.0),
                splashColor: Color.fromRGBO(236, 236, 236, 1.0),
                customBorder: CircleBorder(),
                child: Transform.rotate(
                  angle: rotate,
                  child: Image.asset(
                    'assets/images/body_seb7a.png',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'عدد التسبيحات',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            width: 70.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: MyThemeData.primaryColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text(
              '$counter',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          Container(
            alignment: Alignment.center,
            width: 140.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: MyThemeData.primaryColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text(
              azkar[currentIndex],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onClick() {
    counter++;
    rotate++;
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

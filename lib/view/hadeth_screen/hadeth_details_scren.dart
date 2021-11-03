import 'package:flutter/material.dart';
import 'package:islamic/main.dart';
import 'package:islamic/view/hadeth_screen/hadeth_screen.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth details';

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as HadethItem;

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
          body: Container(
            margin: EdgeInsets.fromLTRB(
              20.0,
              25.0,
              20.0,
              100.0,
            ),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(35.0)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '${arg.title}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 45.0),
                    width: double.infinity,
                    height: 1.0,
                    color: MyThemeData.primaryColor,
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      arg.content,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontFamily: '',
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

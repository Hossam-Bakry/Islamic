import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/main.dart';
import 'package:islamic/view/quran_screen/SuraDetails_screen.dart';

class SuraNameWidegt extends StatelessWidget {
  String suraName;
  int index;
  int ayatNumbers;

  SuraNameWidegt(
    this.suraName,
    this.index,
    this.ayatNumbers,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: SuraDetailsArgs(suraName, index),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$ayatNumbers',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontFamily: '',
                  ),
            ),
          ),
          Container(
            width: 1.0,
            height: 35.0,
            color: MyThemeData.primaryColor,
          ),
          Expanded(
            child: Text(
              suraName,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 22.0),
            ),
          ),
        ],
      ),
    );
  }
}

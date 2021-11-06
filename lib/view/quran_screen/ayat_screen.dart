import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/core/provider/AppProvider.dart';
import 'package:islamic/main.dart';
import 'package:provider/provider.dart';

class AyatScreen extends StatelessWidget {
  List ayat;

  AyatScreen(this.ayat);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.all(7),
      child: Text(
        displayAyat(ayat).toString().replaceAll('[', '').replaceAll(']', ''),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 21.0,
              color: provider.isDarkMode()
                  ? MyThemeData.accentDarkColor.withOpacity(0.9)
                  : Colors.black,
            ),
      ),
    );
  }

  List displayAyat(List ayat) {
    List ayatDisplay = [];
    for (int i = 0; i < ayat.length - 1; i++) {
      ayatDisplay.add(ayat[i] + ' {${i + 1}} ');
    }
    return ayatDisplay;
  }
}

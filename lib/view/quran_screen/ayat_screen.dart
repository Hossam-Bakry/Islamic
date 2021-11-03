import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AyatScreen extends StatelessWidget {
  List ayat;

  AyatScreen(this.ayat);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      child: Text(
        displayAyat(ayat).toString().replaceAll('[', '').replaceAll(']', ''),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 21.0,
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

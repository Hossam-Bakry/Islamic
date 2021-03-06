import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/provider/AppProvider.dart';
import 'package:islamic/main.dart';
import 'package:islamic/view/quran_screen/ayat_screen.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'Sura Details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List ayat = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var arg = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (ayat.isEmpty) readSura(arg.index);

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
              'إسلامي',
            ),
          ),
          body: Container(
            margin: EdgeInsets.fromLTRB(
              20.0,
              25.0,
              20.0,
              80.0,
            ),
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyThemeData.primaryDarkColor.withOpacity(0.6)
                    : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(35.0)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'سورة  ${arg.suraName}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 28.0,
                          color: provider.isDarkMode()
                              ? MyThemeData.accentDarkColor
                              : Colors.black,
                        ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 45.0),
                    width: double.infinity,
                    height: 1.0,
                    color: provider.isDarkMode()
                        ? MyThemeData.accentDarkColor.withOpacity(0.5)
                        : MyThemeData.primaryColor,
                  ),
                  Container(
                    child: ayat.isEmpty
                        ? Center(
                      child: CircularProgressIndicator(
                              color: provider.isDarkMode()
                                  ? MyThemeData.accentDarkColor
                                  : MyThemeData.primaryColor,
                            ),
                    )
                        : AyatScreen(ayat),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  readSura(int index) async {
    String fileName = 'assets/files/${index + 1}.txt';
    String fileContent = await rootBundle.loadString(fileName);
    List verses = fileContent.split('\r\n');
    ayat = verses;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;

  SuraDetailsArgs(this.suraName, this.index);
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/provider/AppProvider.dart';
import 'package:islamic/main.dart';
import 'package:islamic/view/hadeth_screen/hadeth_widget.dart';
import 'package:provider/provider.dart';

class HadethScreen extends StatefulWidget {
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    loadHadeth();
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset('assets/images/basmal.png'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            width: double.infinity,
            height: 1.5,
            color: provider.isDarkMode()
                ? MyThemeData.accentDarkColor
                : MyThemeData.primaryColor,
          ),
          Text(
            'الأحاديث',
            style: Theme.of(context).textTheme.headline5,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            width: double.infinity,
            height: 1.5,
            color: provider.isDarkMode()
                ? MyThemeData.accentDarkColor
                : MyThemeData.primaryColor,
          ),
          Expanded(
            flex: 3,
            child: allHadethItem.isEmpty
                ? Center(
              child: CircularProgressIndicator(
                  color: MyThemeData.primaryColor),
            )
                : ListView.separated(
              itemBuilder: (BuildContext context, int index) =>
                        HadethWidget(allHadethItem[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 50.0, vertical: 2.0),
                      width: double.infinity,
                      height: 0.5,
                      color: provider.isDarkMode()
                          ? MyThemeData.accentDarkColor
                          : MyThemeData.primaryColor,
                    ),
                    itemCount: allHadethItem.length,
                  ),
          ),
        ],
      ),
    );
  }

  List<HadethItem> allHadethItem = [];

  loadHadeth() async {
    List<HadethItem> allHadethData = [];
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadeth = fileContent.split('#\r\n');

    for (int i = 0; i < allHadeth.length; i++) {
      List<String> hadethItem = allHadeth[i].split('\n');
      String title = hadethItem[0];
      String content = '';

      for (int j = 1; j < hadethItem.length; j++) {
        content += hadethItem[j] + ' ';
      }
      HadethItem item = HadethItem(title, content);
      allHadethData.add(item);
    }
    allHadethItem = allHadethData;
    setState(() {});
  }
}

class HadethItem {
  String title;
  String content;

  HadethItem(this.title, this.content);
}

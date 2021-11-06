import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/core/provider/AppProvider.dart';
import 'package:islamic/main.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? valueSelectetd;
  String? modeSelected;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    List<String> languageList = ['English', 'العربية'];
    List<String> themeList = [
      AppLocalizations.of(context)!.dark,
      AppLocalizations.of(context)!.light,
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(
          20.0,
          25.0,
          20.0,
          80.0,
        ),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: provider.isDarkMode()
              ? MyThemeData.primaryDarkColor.withOpacity(0.8)
              : Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 24.0,
                    fontFamily: '',
                  ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15.0)),
              margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: DropdownButton(
                selectedItemBuilder: (BuildContext context) {
                  return languageList.map<Widget>((String item) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                        ),
                      ],
                    );
                  }).toList();
                },
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: '',
                    ),
                underline: SizedBox(),
                iconSize: 28.0,
                alignment: Alignment.bottomCenter,
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      provider.appLanguage == 'en' ? 'English' : 'العربية',
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                borderRadius: BorderRadius.circular(20.0),
                isExpanded: true,
                items: languageList
                    .map(
                      (value) => DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  valueSelectetd = newValue;
                  if (valueSelectetd == 'English') {
                    provider.changeLanguage('en');
                  } else {
                    provider.changeLanguage('ar');
                  }
                  setState(() {});
                },
                value: valueSelectetd,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 24.0,
                    fontFamily: '',
                  ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: DropdownButton(
                selectedItemBuilder: (BuildContext context) {
                  return themeList.map<Widget>((String item) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item,
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                        ),
                      ],
                    );
                  }).toList();
                },
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      provider.appthemeMode == ThemeMode.dark
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                    ),
                  ],
                ),
                underline: SizedBox(),
                iconSize: 28.0,
                borderRadius: BorderRadius.circular(20.0),
                isExpanded: true,
                items: [
                  AppLocalizations.of(context)!.dark,
                  AppLocalizations.of(context)!.light,
                ]
                    .map(
                      (String value) => DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  modeSelected = newValue;

                  print(modeSelected);
                  modeSelected == AppLocalizations.of(context)!.dark
                      ? provider.changeThemeMode(ThemeMode.dark)
                      : provider.changeThemeMode(ThemeMode.light);
                },
                value: modeSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

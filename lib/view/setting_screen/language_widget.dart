import 'package:flutter/material.dart';
import 'package:islamic/core/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15.0)),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? selectedItemLanguage('English', context)
                : unselectedItemLanguage('English', context),
          ),
          InkWell(
            onTap: () {
              // provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? selectedItemLanguage('العربية', context)
                : unselectedItemLanguage('العربية', context),
          ),
        ],
      ),
    );
  }

  Widget selectedItemLanguage(String text, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontFamily: '',
                ),
          ),
          Icon(
            Icons.check,
            size: 28.0,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  Widget unselectedItemLanguage(String text, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontFamily: '',
                ),
          ),
          Icon(
            Icons.check,
            size: 28.0,
          ),
        ],
      ),
    );
  }
}

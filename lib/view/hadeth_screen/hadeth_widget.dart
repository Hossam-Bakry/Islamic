import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/view/hadeth_screen/hadeth_details_scren.dart';
import 'package:islamic/view/hadeth_screen/hadeth_screen.dart';

class HadethWidget extends StatelessWidget {
  HadethItem item;

  HadethWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetailsScreen.routeName,
          arguments: item,
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          item.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}

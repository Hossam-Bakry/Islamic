import 'package:flutter/material.dart';
import 'package:islamic/main.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_pic.png'),
          const SizedBox(height: 40.0),
          Text(
            'إذاعة القرآن الكريم',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: Icon(
                  Icons.skip_previous_sharp,
                  color: MyThemeData.primaryColor,
                  size: 30.0,
                ),
                onPressed: () {},
              ),
              Container(
                alignment: Alignment(-2, -2),
                height: 60.0,
                width: 60.0,
                child: IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    color: MyThemeData.primaryColor,
                    size: 60.0,
                  ),
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.skip_next_sharp,
                  color: MyThemeData.primaryColor,
                  size: 30.0,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

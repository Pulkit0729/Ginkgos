import 'package:flutter/material.dart';
import 'package:go_green/screens/main_screen.dart';

import '../main.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MainScreen.id,
              arguments: ScreenArguments(index: 0));
        },
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xffA3EBB1),
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Text('Skip',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ))));
  }
}

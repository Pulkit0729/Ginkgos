import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/login_screen.dart';
import 'package:go_green/UI/widgets/roundButton.dart';

class LoginBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Wrap(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
                SizedBox(height: 10),
                RoundButton(
                    text: 'Login / Signup',
                    function: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    color: Colors.green[400]),
                SizedBox(height: 10)
              ])
        ]));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/screens/main_screen.dart';
import 'package:go_green/widgets/inputField.dart';
import 'package:go_green/widgets/roundButton.dart';

class NameScreen extends StatelessWidget {
  static String id = 'name_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            InputField(text: 'Name'),
            InputField(text: 'Email'),
            RoundButton(
                text: 'Submit',
                function: () {
                  Navigator.pushNamed(context, MainScreen.id,
                      arguments: ScreenArguments(0));
                })
          ],
        ),
      ),
    );
  }
}

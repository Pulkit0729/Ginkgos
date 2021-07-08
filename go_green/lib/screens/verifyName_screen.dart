import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/constants/inputDecorations.dart';
import 'package:go_green/screens/main_screen.dart';
import 'package:go_green/widgets/roundButton.dart';

import '../main.dart';

class NameScreen extends StatelessWidget {
  static String id = 'name_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
            leading: Container(),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Personal Details',
                style: TextStyle(color: Colors.black))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Tell Us a bit more about yourself.",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 19)),
              SizedBox(height: 30),
              Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
                      autofocus: true,
                      decoration: kTextInputDeco.copyWith(
                          hintText: 'Name',
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.green,
                          )))),
              SizedBox(height: 10),
              Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: kTextInputDeco.copyWith(
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.green,
                          )))),
              SizedBox(height: 20),
              RoundButton(
                  text: 'Submit',
                  color: Colors.green,
                  function: () {
                    Navigator.pushNamed(context, MainScreen.id,
                        arguments: ScreenArguments(index: 0));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

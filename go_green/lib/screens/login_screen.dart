import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/constants/constants.dart';
import 'package:go_green/screens/main_screen.dart';
import 'package:go_green/screens/verifyOtp_screen.dart';

import 'package:go_green/widgets/inputField.dart';
import 'package:go_green/widgets/roundButton.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    ////To remove focus of text field//////
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: kLogInBackground,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MainScreen.id,
                        arguments: ScreenArguments(0));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        color: Color(0xffA3EBB1),
                        fontSize: 16,
                        backgroundColor: Colors.black12),
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  'images/logo2.png',
                  scale: 3,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InputField(text: 'PhoneNumber'),
                      SizedBox(
                        height: 10,
                      ),
                      RoundButton(
                          text: 'Send OTP',
                          function: () {
                            Navigator.pushNamed(context, VerifyOtp.id);
                          },
                          color: kSendOTPColor),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'By continuing you agree to our Terms of Condition',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

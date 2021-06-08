import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/screens/verifyName_screen.dart';
import 'package:go_green/widgets/inputField.dart';

class VerifyOtp extends StatelessWidget {
  static String id = 'verify_otp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputField(text: 'OTP'),
              Text("Didn't get the opt? Resend"),
              Text('00:30'),
              Material(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NameScreen.id);
                  },
                  child: Text('Verify OTP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_green/constants/colorsConstant.dart';
import 'package:go_green/screens/verifyName_screen.dart';
import 'package:go_green/widgets/otpScreen/otpForm.dart';
import 'package:go_green/widgets/otpScreen/otpTimer.dart';
import 'package:go_green/widgets/roundButton.dart';

class VerifyOtp extends StatelessWidget {
  static String id = 'verify_otp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Enter Verification Code',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: SvgPicture.asset(
                  'images/otp.svg',
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              Column(
                children: [
                  Text('Enter OTP send to +918059345289',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center),
                  OtpForm(),
                ],
              ),
              RoundButton(
                  text: 'Verify',
                  function: () {
                    Navigator.pushReplacementNamed(context, NameScreen.id);
                  },
                  color: kPrimaryColor),
              Column(
                children: [
                  OTPTimer(),
                  Text("Didn't get the opt? Resend",
                      textAlign: TextAlign.center),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

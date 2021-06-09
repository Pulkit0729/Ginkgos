import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/constants/constants.dart';
import 'package:go_green/screens/verifyName_screen.dart';
import 'package:go_green/widgets/optScreen/otpForm.dart';
import 'package:go_green/widgets/optScreen/otpIcon.dart';
// import 'package:go_green/widgets/optScreen/otpIcon.dart';
import 'package:go_green/widgets/optScreen/otpTimer.dart';
import 'package:go_green/widgets/roundButton.dart';
import '../size_config.dart';

class VerifyOtp extends StatelessWidget {
  static String id = 'verify_otp';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); //To determine the screen size.
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpIcon(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Enter OTP send to +918059345289',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center),
                    OtpForm(),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    RoundButton(
                        text: 'Verify',
                        function: () {
                          Navigator.pushNamed(context, NameScreen.id);
                        },
                        color: kLogInBackground),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    OTPTimer(),
                    Text("Didn't get the opt? Resend",
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_green/UI/constants/inputDecorations.dart';
import 'package:go_green/UI/screens/loadingScreen.dart';
import 'package:go_green/UI/screens/verifyName_screen.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';
import 'package:go_green/UI/widgets/otpTimer.dart';
import 'package:go_green/backend/provider/firebase/authentication.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../main.dart';

class VerifyOtp extends StatefulWidget {
  static String id = 'verify_otp';

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  late Authentication authentication;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  void _verify(String inputOTP) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: authentication.verificationCode,
              smsCode: inputOTP))
          .then((value) async {
        if (value.user != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoadingScreen()),
              (route) => false);
        }
      });
    } catch (e) {
      setState(() {
        _pinPutController.clear();
      });
      Navigator.of(context, rootNavigator: true).pop();
      CustomSnackWidgets.buildErrorSnackBar(context, 'Invalid Otp');
    }
  }

  @override
  void initState() {
    super.initState();

    ///To access buildContext in initState we use future
    Future.delayed(Duration.zero, () {
      String? phone =
          (ModalRoute.of(context)!.settings.arguments as ScreenArguments).phone;

      ///Initialize an authentication object///
      authentication = Authentication(phone, () {
        Navigator.pushNamed(context, NameScreen.id);
      });
      authentication.verifyPhone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            title: Text('Enter Verification Code',
                style: TextStyle(color: Colors.black))),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                          child: SvgPicture.asset('images/svg/otp.svg',
                              width: MediaQuery.of(context).size.width * 0.7)),
                      Column(children: [
                        Text(
                            'Enter OTP send to +91${(ModalRoute.of(context)!.settings.arguments as ScreenArguments).phone!}',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: PinPut(
                                withCursor: true,
                                cursor: Container(
                                    width: 1,
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    color: Colors.grey),
                                fieldsCount: 6,
                                textStyle: const TextStyle(fontSize: 20.0),
                                eachFieldWidth:
                                    MediaQuery.of(context).size.width * 0.1,
                                eachFieldHeight:
                                    MediaQuery.of(context).size.height * 0.07,
                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                submittedFieldDecoration: pinPutDecoration,
                                selectedFieldDecoration: pinPutDecoration,
                                followingFieldDecoration: pinPutDecoration,
                                pinAnimationType: PinAnimationType.none,
                                onSubmit: (pin) async {
                                  LoadingBar.createLoading(context);
                                  _verify(pin);
                                }))
                      ]),
                      OTPTimer(function: () {
                        authentication.verifyPhone();
                      })
                    ]))));
  }
}

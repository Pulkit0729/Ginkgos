import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_green/constants/inputDecorations.dart';
import 'package:go_green/firebase/authentication.dart';
import 'package:go_green/screens/verifyName_screen.dart';
import 'package:go_green/widgets/otpScreen/otpTimer.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../main.dart';

class VerifyOtp extends StatefulWidget {
  static String id = 'verify_otp';

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  late Authentication authentication;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  createLoading(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SpinKitCircle(color: Colors.black);
        });
  }

  @override
  void initState() {
    super.initState();

    ///To access buildContext in initState we use future
    Future.delayed(Duration.zero, () {
      authentication = Authentication(
          (ModalRoute.of(context)!.settings.arguments as ScreenArguments)
              .phone!, () {
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
                  Text(
                      'Enter OTP send to +91${(ModalRoute.of(context)!.settings.arguments as ScreenArguments).phone!}',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: PinPut(
                      fieldsCount: 6,
                      textStyle: const TextStyle(fontSize: 25.0),
                      eachFieldWidth: MediaQuery.of(context).size.width * 0.1,
                      eachFieldHeight:
                          MediaQuery.of(context).size.height * 0.07,
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: pinPutDecoration,
                      selectedFieldDecoration: pinPutDecoration,
                      followingFieldDecoration: pinPutDecoration,
                      pinAnimationType: PinAnimationType.none,
                      onSubmit: (pin) async {
                        createLoading(context);
                        print('Helo');
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(
                                  PhoneAuthProvider.credential(
                                      verificationId:
                                          authentication.verificationCode,
                                      smsCode: pin))
                              .then((value) async {
                            if (value.user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NameScreen()),
                                  (route) => false);
                            }
                          });
                        } catch (e) {
                          setState(() {
                            _pinPutController.clear();
                          });
                          Navigator.of(context, rootNavigator: true).pop();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Invalid Otp',
                                style: TextStyle(color: Colors.black)),
                            backgroundColor: Colors.white,
                            duration: Duration(seconds: 1),
                          ));
                        }
                      },
                    ),
                  )
                ],
              ),
              OTPTimer(function: () {
                authentication.verifyPhone();
              })
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingBar extends StatelessWidget {
  const LoadingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/constants/colorsConstant.dart';
import 'package:go_green/constants/inputDecorations.dart';
import 'package:go_green/screens/verifyOtp_screen.dart';
import 'package:go_green/widgets/roundButton.dart';
import 'package:go_green/widgets/skipWidget.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///Input Field Controller
  TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  createLoading(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SpinKitCircle(color: Colors.black);
        });
  }

  @override
  Widget build(BuildContext context) {
    ///To remove focus of text field//
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(10),
                  child: SkipButton()),

              ///Logo//
              Expanded(child: Image.asset('images/logo2.png', scale: 3)),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          autofocus: true,
                          decoration: kTextInputDeco.copyWith(
                              hintText: 'Phone Number',
                              prefixIcon: Icon(
                                Icons.account_circle_sharp,
                                color: kPrimaryColor,
                              ))),
                      SizedBox(
                        height: 10,
                      ),
                      RoundButton(
                        text: 'Send OTP',
                        color: kPrimaryColorDark,
                        function: () {
                          String _phone = _phoneController.text;
                          if (_phone.length != 10) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Enter Valid Mobile',
                                  style: TextStyle(color: Colors.black)),
                              backgroundColor: Colors.white,
                              duration: Duration(seconds: 1),
                            ));
                          } else {
                            createLoading(context);
                            Future.delayed(Duration(milliseconds: 500), () {
                              ///Remove Loading Bar
                              Navigator.popAndPushNamed(context, VerifyOtp.id,
                                  arguments: ScreenArguments(phone: _phone));
                            });
                          }
                        },
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'By continuing you agree to our Terms of Condition',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
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

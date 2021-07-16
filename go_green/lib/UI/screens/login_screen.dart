import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/constants/inputDecorations.dart';
import 'package:go_green/UI/screens/verifyOtp_screen.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';
import 'package:go_green/UI/widgets/roundButton.dart';

import '../../main.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  final TextEditingController _phoneController = TextEditingController();

  void _onPress(BuildContext context) {
    String _phone = _phoneController.text;
    if (_phone.length != 10) {
      CustomSnackWidgets.buildErrorSnackBar(context, 'Invalid Phone Number');
    } else {
      LoadingBar.createLoading(context);
      Future.delayed(Duration(milliseconds: 500), () {
        ///Remove Loading Bar
        Navigator.popAndPushNamed(context, VerifyOtp.id,
            arguments: ScreenArguments(phone: _phone));
      });
    }
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

              ///Input Phone and Submit///
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
                          maxLength: 10,
                          decoration: kTextInputDeco.copyWith(
                              hintText: 'Phone Number',
                              counterText: '',
                              prefixIcon: Icon(
                                Icons.account_circle_sharp,
                                color: kPrimaryColor,
                              ))),
                      SizedBox(height: 10),
                      RoundButton(
                        text: 'Send OTP',
                        color: kPrimaryColorDark,
                        function: () {
                          _onPress(context);
                        },
                      ),
                      Expanded(child: SizedBox()),
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

///Skip Button Widget///
class SkipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.popAndPushNamed(context, MainScreen.id,
              arguments: ScreenArguments(index: 0));
        },
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xffA3EBB1),
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Text('Skip',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ))));
  }
}
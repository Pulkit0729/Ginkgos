import 'dart:ui';
import 'package:flutter/material.dart';

//Constant Colors
Color? kLogInBackground = Colors.green[400];
Color? kSendOTPColor = Colors.green[700];

InputDecoration kOtpInputDeco = InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1)));

//TextStyle//

const kTimerStyle = TextStyle(fontSize: 24, color: Colors.grey);

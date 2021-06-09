import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/constants/constants.dart';

class OTPTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
        tween: Tween(begin: Duration(seconds: 30), end: Duration(seconds: 0)),
        duration: Duration(seconds: 30),
        builder: (context, value, child) => Text(
            "00:${value.inSeconds.toInt()}",
            textAlign: TextAlign.center,
            style: kTimerStyle));
  }
}

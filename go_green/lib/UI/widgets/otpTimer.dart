import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';

class OTPTimer extends StatefulWidget {
  final function;
  const OTPTimer({this.function});
  @override
  _OTPTimerState createState() => _OTPTimerState();
}

class _OTPTimerState extends State<OTPTimer>
    with SingleTickerProviderStateMixin {
  bool isEnabled = false;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 30),
        upperBound: 30,
        lowerBound: 0);

    controller.reverse(from: 30);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.value == 0) {
      setState(() {
        isEnabled = true;
        controller.reset();
      });
    }
    return Column(children: [
      isEnabled
          ? Container()
          : Text("00:${controller.value.toInt()}",
              textAlign: TextAlign.center, style: kTimerStyle),
      TextButton(
          onPressed: isEnabled
              ? () {
                  widget.function();
                  setState(() {
                    isEnabled = false;
                    controller.reverse(from: 30);
                  });
                }
              : () {},
          child: Text("Didn't get the opt? Resend",
              textAlign: TextAlign.center,
              style: TextStyle(color: isEnabled ? Colors.black : Colors.grey)))
    ]);
  }
}

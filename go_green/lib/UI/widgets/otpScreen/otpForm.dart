import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/inputDecorations.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: kOtpInputDeco,
              onChanged: (value) {
                nextField(value, pin2FocusNode);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              focusNode: pin2FocusNode,
              decoration: kOtpInputDeco,
              onChanged: (value) {
                nextField(value, pin3FocusNode);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              focusNode: pin3FocusNode,
              decoration: kOtpInputDeco,
              onChanged: (value) {
                nextField(value, pin4FocusNode);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              focusNode: pin4FocusNode,
              decoration: kOtpInputDeco,
              onChanged: (value) {
                nextField(value, pin5FocusNode);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              focusNode: pin5FocusNode,
              decoration: kOtpInputDeco,
              onChanged: (value) {
                nextField(value, pin6FocusNode);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              focusNode: pin6FocusNode,
              decoration: kOtpInputDeco,
              onChanged: (value) {
                pin6FocusNode.unfocus();
              },
            ),
          ),
        ),
      ],
    );
  }
}

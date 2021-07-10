import 'package:flutter/material.dart';

class CustomSnackWidgets {
  CustomSnackWidgets._();
  static buildErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      duration: Duration(seconds: 1),
    ));
  }
}

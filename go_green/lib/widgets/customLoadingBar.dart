import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar {
  LoadingBar._();
  static createLoading(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SpinKitCircle(color: Colors.black);
        });
  }
}

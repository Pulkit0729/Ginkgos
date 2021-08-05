import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';

class LoadingBar {
  LoadingBar._();
  static createLoading(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return CustomLoader();
        });
  }
}

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(color: kLoadingColor!, size: 33, lineWidth: 3);
  }
}

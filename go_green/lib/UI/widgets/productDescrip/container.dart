import 'package:flutter/material.dart';

class NewContainer extends StatelessWidget {
  const NewContainer({this.child});

  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
      color: Colors.white,
      child: child,
    );
  }
}

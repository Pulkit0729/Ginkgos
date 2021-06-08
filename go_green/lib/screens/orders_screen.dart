import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/widgets/appBar2.dart';

class OrderScreen extends StatelessWidget {
  static String id = 'orderScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2('Orders'),
    );
  }
}

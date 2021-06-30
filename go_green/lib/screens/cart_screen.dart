import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/screens/selectAddressScreen.dart';
import 'package:go_green/widgets/appBar2.dart';
import 'package:go_green/widgets/cartScreen/cartFooter.dart';
import 'package:go_green/widgets/cartScreen/cartStageWidget.dart';

import '../main.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cartScreen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2('Cart'),
      body: SafeArea(
          child: ListView(children: [
        CartStage(
          index: 0,
        ),
      ])),
      bottomNavigationBar: CartFooter(
          text: 'Place Order',
          function: () {
            Navigator.of(context).push(noAnimationRoute(SelectAddressScreen()));
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/screens/payment_screen.dart';
import 'package:go_green/widgets/appBar2.dart';
import 'package:go_green/widgets/cartScreen/cartFooter.dart';
import 'package:go_green/widgets/cartScreen/cartStageWidget.dart';

import '../main.dart';

class SelectAddressScreen extends StatefulWidget {
  static String id = 'selectAddressScreen';

  @override
  _SelectAddressScreenState createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2('Address'),
      body: SafeArea(
          child: ListView(children: [
        CartStage(
          index: 1,
        ),
      ])),
      bottomNavigationBar: CartFooter(
        text: 'Proceed',
        function: () {
          Navigator.of(context).push(noAnimationRoute(PaymentScreen()));
        },
      ),
    );
  }
}

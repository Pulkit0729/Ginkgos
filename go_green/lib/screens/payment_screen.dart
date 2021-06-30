import 'package:flutter/material.dart';
import 'package:go_green/widgets/appBar2.dart';
import 'package:go_green/widgets/cartScreen/cartFooter.dart';
import 'package:go_green/widgets/cartScreen/cartStageWidget.dart';

class PaymentScreen extends StatefulWidget {
  static String id = 'paymentScreen';

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2('Payments'),
      body: SafeArea(
          child: ListView(children: [
        CartStage(
          index: 2,
        ),
      ])),
      bottomNavigationBar: CartFooter(
        text: 'Confirm',
      ),
    );
  }
}

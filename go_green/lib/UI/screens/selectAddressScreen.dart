import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/payment_screen.dart';
import 'package:go_green/UI/widgets/appBar2.dart';
import 'package:go_green/UI/widgets/cartScreen/cartFooter.dart';
import 'package:go_green/UI/widgets/cartScreen/cartStageWidget.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/UI/widgets/selectAddressWidget.dart';

import '../../main.dart';

class SelectAddressScreen extends StatefulWidget {
  static String id = 'selectAddressScreen';

  @override
  _SelectAddressScreenState createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldGrey,
      appBar: AppBar2('Address'),
      body: SafeArea(
          child: ListView(
        children: [
          CartStage(index: 1),
          SelectAddressWidget(
            name: 'Pulkit Aggarwal',
            type: 'Work',
            number: '8059345289',
            pinCode: '123401',
            state: 'Haryana',
            city: 'Rewari',
            address: 'A-38',
            locality: 'Ansal',
          ),
          NewContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price(2 items)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                Text(
                  '340',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                )
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: CartFooter(
        text: 'Proceed',
        function: () {
          Navigator.of(context).push(noAnimationRoute(PaymentScreen()));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/main_screen.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/backend/models/orderObject.dart';

import 'orderDetailsScreen.dart';

class ConfirmedCancel extends StatelessWidget {
  final OrderObject orderObject;

  const ConfirmedCancel({required this.orderObject});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, MainScreen.id, (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
                color: Colors.green,
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Cancelled',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text('Your order has been cancelled',
                        style: TextStyle(color: Colors.white, fontSize: 20))
                  ],
                )),
            ListTile(
              title: Text('Refundable Amount'),
              subtitle: Text(
                  orderObject.modeOfPayment == 'It can take up to 4 days'
                      ? orderObject.priceDetailsObject.totalAmount
                      : 'No refund'),
              trailing: Text(orderObject.modeOfPayment == 'Online'
                  ? orderObject.priceDetailsObject.totalAmount
                  : '0'),
            ),
            NewContainer(
                child: Column(children: [
              OrderInfoTile(text: 'Order ID', value: orderObject.orderId),
              OrderInfoTile(
                  text: 'Order date',
                  value: orderObject.orderDate.split(' ')[0]),
              OrderInfoTile(
                  text: 'Order Total',
                  value: orderObject.priceDetailsObject.totalAmount),
              OrderInfoTile(
                  text: 'Mode of Payment', value: orderObject.modeOfPayment)
            ])),
          ],
        ),
      ),
    );
  }
}

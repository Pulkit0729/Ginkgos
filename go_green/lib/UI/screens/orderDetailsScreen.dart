import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/orderCancelScreen.dart';
import 'package:go_green/UI/widgets/addressTile(OrderDetails).dart';
import 'package:go_green/UI/widgets/cartScreen/priceDetails.dart';
import 'package:go_green/UI/widgets/productCard/productCard(OrderDetails).dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/backend/models/orderObject.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderObject orderObject;
  const OrderDetailsScreen({required this.orderObject});

  void _onCancel(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Do you really want to cancel the order?'),
              actions: [
                Row(children: [
                  Expanded(
                      child: TextButton(
                          child: Text('Cancel'),
                          onPressed: () => Navigator.pop(context))),
                  Expanded(
                      child: TextButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderCancelScreen(
                                        orderObject: orderObject)));
                          }))
                ])
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldGrey,
        appBar: AppBar(title: Text('Order Details')),
        body: ListView(children: [
          NewContainer(
              child: Column(children: [
            OrderInfoTile(text: 'Order ID', value: orderObject.orderId),
            OrderInfoTile(
                text: 'Order date', value: orderObject.orderDate.split(' ')[0]),
            OrderInfoTile(
                text: 'Order Total',
                value: orderObject.priceDetailsObject.totalAmount),
            OrderInfoTile(
                text: 'Mode of Payment', value: orderObject.modeOfPayment)
          ])),
          Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 7),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: Text(
                '${orderObject.orderItems.length} items',
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.w700),
              )),
          ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: orderObject.orderItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard6(orderItem: orderObject.orderItems[index]);
              }),
          AddressTile2(addressObject: orderObject.addressObject),
          PriceDetails(priceDetailsObject: orderObject.priceDetailsObject),
          (orderObject.status != 'Delivered' &&
                  orderObject.status != 'Cancelled' &&
                  orderObject.status != 'Out_for_delivery')
              ? TextButton(
                  onPressed: () => _onCancel(context),
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                )
              : Container()
        ]));
  }
}

class OrderInfoTile extends StatelessWidget {
  final String text;
  final String value;
  const OrderInfoTile({Key? key, required this.text, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 7),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(text), Text(value)])
    ]);
  }
}

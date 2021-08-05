import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/widgets/addressTile(OrderDetails).dart';
import 'package:go_green/UI/widgets/cartScreen/priceDetails.dart';
import 'package:go_green/UI/widgets/productCard/productCard(OrderDetails).dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/backend/models/orderObject.dart';

class OrderDetailsScreen extends StatelessWidget {
  static String id = 'ordersDetails';
  final OrderObject orderObject;

  const OrderDetailsScreen({Key? key, required this.orderObject})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldGrey,
        appBar: AppBar(title: Text('Order Details')),
        body: ListView(
          children: [
            NewContainer(
                child: Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Order id'), Text(orderObject.orderId)]),
              SizedBox(height: 7),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Order date'),
                Text(orderObject.orderDate.split(' ')[0])
              ]),
              SizedBox(height: 7),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Order total'),
                Text(orderObject.priceDetailsObject.totalAmount)
              ])
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
            AddressTile2(
              addressObject: orderObject.addressObject,
            ),
            PriceDetails(
              priceDetailsObject: orderObject.priceDetailsObject,
            )
          ],
        ));
  }
}

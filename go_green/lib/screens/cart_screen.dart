import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/constants/colorsConstant.dart';
import 'package:go_green/screens/selectAddressScreen.dart';
import 'package:go_green/widgets/appBar2.dart';
import 'package:go_green/widgets/cartScreen/cartFooter.dart';
import 'package:go_green/widgets/cartScreen/cartStageWidget.dart';
import 'package:go_green/widgets/cartScreen/priceDetails.dart';
import 'package:go_green/widgets/productCard/productCard(Cart).dart';

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
        backgroundColor: kScaffoldGrey,
        appBar: AppBar2('Cart'),
        body: SafeArea(
            child: ListView(
          children: [
            CartStage(index: 0),
            ProductCard4(
                name: 'Croton',
                short: 'Indoor Plant',
                price: '150',
                cutPrice: '250',
                discount: '40',
                image: 'images/product.jpg',
                sizes: ['1', '2', '3']),
            ProductCard4(
                name: 'Croton',
                short: 'Indoor Plant',
                price: '150',
                cutPrice: '250',
                discount: '40',
                image: 'images/product.jpg',
                sizes: ['1', '2', '3']),
            PriceDetails(
              totalAmount: '340',
              totalPrice: '500',
              discount: '200',
              couponDiscount: '0',
              deliveryCharge: '40',
            )
          ],
        )),
        bottomNavigationBar: CartFooter(
            text: 'Place Order',
            function: () {
              Navigator.of(context)
                  .push(noAnimationRoute(SelectAddressScreen()));
            }));
  }
}

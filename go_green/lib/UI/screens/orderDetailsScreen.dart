import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/widgets/addressTile(OrderDetails).dart';
import 'package:go_green/UI/widgets/appBar2.dart';
import 'package:go_green/UI/widgets/cartScreen/priceDetails.dart';
import 'package:go_green/UI/widgets/productCard/productCard(OrderDetails).dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';

class OrderDetailsScreen extends StatelessWidget {
  static String id = 'ordersDetails';
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldGrey,
      appBar: AppBar2('Order Details'),
      body: ListView(
        children: [
          NewContainer(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Order id'), Text('#12345678890')],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Order date'), Text('29-08-2001')],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Order total'), Text('500')],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              '2 items',
              style: TextStyle(
                  color: Colors.grey[700], fontWeight: FontWeight.w700),
            ),
          ),
          ProductCard6(
            name: 'Croton',
            price: '150',
            status: 'Approved',
            image: 'images/product.jpeg',
          ),
          ProductCard6(
            name: 'Croton',
            price: '150',
            status: 'Approved',
            image: 'images/product.jpeg',
          ),
          AddressTile2(
            name: 'Pulkit Aggarwal',
            type: 'Work',
            number: '8059345289',
            pinCode: '123401',
            state: 'Haryana',
            city: 'Rewari',
            address: 'A-38',
            locality: 'Ansal',
          ),
          PriceDetails(
            totalAmount: '340',
            totalPrice: '500',
            discount: '200',
            couponDiscount: '0',
            deliveryCharge: '40',
          )
        ],
      ),
    );
  }
}

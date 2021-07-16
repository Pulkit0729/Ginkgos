import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/widgets/appBar2.dart';
import 'package:go_green/UI/widgets/orderTile.dart';

class OrderScreen extends StatelessWidget {
  static String id = 'orderScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldGrey,
      appBar: AppBar2('Orders'),
      body: Column(
        children: [
          OrderScreenHeader(),
          SizedBox(
            height: 7,
          ),
          Expanded(
            child: ListView(
              children: [
                OrderTile(),
                OrderTile(),
                OrderTile(),
                OrderTile(),
                OrderTile(),
                OrderTile()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderScreenHeader extends StatelessWidget {
  const OrderScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.black26)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search your Order",
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            height: 30,
            width: 1,
            color: Colors.black12,
          ),
          Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.filter_alt_outlined),
                    Text('Filter'),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

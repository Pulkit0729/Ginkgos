import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/widgets/appBar2.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cartscreen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2('Cart'),
    );
  }
}

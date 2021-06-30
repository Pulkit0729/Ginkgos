import 'package:flutter/material.dart';
import 'package:go_green/screens/productDescription_screen.dart';

class WishlistScreen extends StatefulWidget {
  static String id = 'wishlist';
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FloatingActionButton(
      child: Text('Product'),
      onPressed: () {
        Navigator.pushNamed(context, ProductDescriptionScreen.id);
      },
    ));
  }
}

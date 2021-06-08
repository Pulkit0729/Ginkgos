import 'package:flutter/cupertino.dart';

class WishlistScreen extends StatefulWidget {
  static String id = 'wishlist';
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Wishlist'),
    );
  }
}

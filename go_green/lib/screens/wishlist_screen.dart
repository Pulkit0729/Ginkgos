import 'package:flutter/material.dart';
import 'package:go_green/widgets/productCard/productCard(Wishlist).dart';

class WishlistScreen extends StatefulWidget {
  static String id = 'wishlist';
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              child: ProductCard5(
                name: 'Croton',
                short: 'Indoor Plant',
                price: '150',
                cutPrice: '250',
                discount: '40',
                image: 'images/product.webp',
              ),
            ),
            Expanded(
              child: ProductCard5(
                name: 'Croton',
                short: 'Indoor Plant',
                price: '150',
                cutPrice: '250',
                discount: '40',
                image: 'images/product.webp',
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ProductCard5(
                name: 'Croton',
                short: 'Indoor Plant',
                price: '150',
                cutPrice: '250',
                discount: '40',
                image: 'images/product.webp',
              ),
            ),
            Expanded(
              child: ProductCard5(
                name: 'Croton',
                short: 'Indoor Plant',
                price: '150',
                cutPrice: '250',
                discount: '40',
                image: 'images/product.webp',
              ),
            )
          ],
        ),
      ],
    );
  }
}

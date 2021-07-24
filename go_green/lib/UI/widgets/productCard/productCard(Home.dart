import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/productDescription_screen.dart';
import 'package:go_green/backend/models/product.dart';

import '../../../main.dart';

class ProductCard2 extends StatelessWidget {
  const ProductCard2({required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDescriptionScreen.id,
            arguments: ScreenArguments(product: product));
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: Colors.grey[300]!, width: 0.4)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
                flex: 3,
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: Image.network(product.image[0],
                        fit: BoxFit.fitHeight))),
            Expanded(
                flex: 1,
                child: Column(children: [
                  Text(product.name),
                  Text('Min ${product.discount}% off',
                      style: TextStyle(color: Colors.green))
                ]))
          ])),
    );
  }
}

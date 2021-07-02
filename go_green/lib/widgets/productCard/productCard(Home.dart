import 'package:flutter/material.dart';

class ProductCard2 extends StatelessWidget {
  const ProductCard2({this.image, this.price});
  final image;
  final price;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.grey[300]!, width: 0.4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Image.asset(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(price),
                  Text(
                    'Min 30% off',
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

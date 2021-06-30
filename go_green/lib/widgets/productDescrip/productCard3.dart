import 'package:flutter/material.dart';
import 'package:go_green/constants/textStyles.dart';

class ProductCard3 extends StatelessWidget {
  const ProductCard3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset('images/product.jpeg'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Croton', style: kProductCard3Name),
        Text('Indooor PLant ', style: kProductCard3Short),
        SizedBox(height: 7),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('₹150 ', style: kProductCard3Price),
            Text('250 ', style: kProductCard3CutPrice),
            Text(' 40% off ', style: kProductCard3Discount)
          ],
        ),
      ],
    );
  }
}

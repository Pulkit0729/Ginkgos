import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';

import 'container.dart';

class ProductName extends StatelessWidget {
  const ProductName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('White Pot', style: kProductName),
              Text(
                '  Indoor Plant',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('₹150 ', style: kProductPrice),
              SizedBox(width: 3),
              Text('₹250 ', style: kProductCutPrice),
              SizedBox(width: 5),
              Text('40% OFF ', style: kProductDiscount)
            ],
          ),
          SizedBox(height: 5),
          Text(
            '⭐⭐⭐⭐⭐ (62)',
          ),
        ],
      ),
    );
  }
}

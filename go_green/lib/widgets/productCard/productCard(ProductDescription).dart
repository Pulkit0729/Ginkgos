import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/constants/textStyles.dart';

class ProductCard3 extends StatelessWidget {
  const ProductCard3({
    Key? key,
    this.name,
    this.short,
    this.price,
    this.cutPrice,
    this.discount,
    this.image,
  }) : super(key: key);
  final name;
  final short;
  final price;
  final cutPrice;
  final discount;
  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      padding: EdgeInsets.only(left: 2, bottom: 2),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(name, style: kProductCard3Name),
          Text(short, style: kProductCard3Short),
          SizedBox(height: 7),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('₹$price ', style: kProductCard3Price),
              Text('$cutPrice ', style: kProductCard3CutPrice),
              Text(' $discount% off ', style: kProductCard3Discount)
            ],
          ),
        ],
      ),
    );
  }
}

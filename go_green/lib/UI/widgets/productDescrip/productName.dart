import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'container.dart';

class ProductName extends StatelessWidget {
  const ProductName(
      {this.name,
      this.short,
      this.discount,
      this.price,
      this.cutPrice,
      this.rating});
  final name;
  final short;
  final price;
  final cutPrice;
  final discount;
  final rating;

  num average() {
    num totalStars = 0;
    for (var i = 0; i < rating.length; i++) {
      totalStars = totalStars + rating[i] * (i + 1);
    }
    return (totalStars / rating.fold(0, (p, c) => p + c)).truncate();
  }

  @override
  Widget build(BuildContext context) {
    var totalRatings = rating.fold(0, (p, c) => p + c);
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(name, style: kProductName),
                Text('  $short', style: TextStyle(color: Colors.grey))
              ]),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('₹$price ', style: kProductPrice),
              SizedBox(width: 3),
              Text('₹$cutPrice ', style: kProductCutPrice),
              SizedBox(width: 5),
              Text('$discount% OFF ', style: kProductDiscount)
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              totalRatings != 0
                  ? RatingBarIndicator(
                      rating: average().toDouble(),
                      itemBuilder: (context, index) =>
                          Icon(Icons.star, color: Colors.amber),
                      itemSize: 20)
                  : Container(),
              totalRatings != 0 ? Text(' ($totalRatings)') : Container(),
            ],
          ),
        ],
      ),
    );
  }
}

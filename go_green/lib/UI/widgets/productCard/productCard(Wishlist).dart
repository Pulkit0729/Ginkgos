import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/screens/productDescription_screen.dart';

class ProductCard5 extends StatelessWidget {
  const ProductCard5(
      {Key? key,
      this.name,
      this.short,
      this.price,
      this.cutPrice,
      this.discount,
      this.image})
      : super(key: key);
  final name;
  final short;
  final price;
  final cutPrice;
  final discount;
  final image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDescriptionScreen.id);
      },
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.only(left: 2, bottom: 2),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  right: 3,
                  top: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        border: Border.all(width: 0.5)),
                    child: Icon(
                      Icons.close_sharp,
                      color: Colors.black54,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(name, style: kProductCardName),
                      Text(short, style: kProductCardShort),
                      SizedBox(height: 7),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('₹$price ', style: kProductCardPrice),
                          Text('$cutPrice ', style: kProductCardCutPrice),
                          Text(' $discount% off ', style: kProductCardDiscount)
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                      width: 30,
                      height: 30,
                      right: 0,
                      top: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_shopping_cart,
                        ),
                        iconSize: 20,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

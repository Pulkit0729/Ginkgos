import 'package:flutter/material.dart';
import 'package:go_green/constants/textStyles.dart';
import 'package:go_green/widgets/cartScreen/customDropDown.dart';

class ProductCard4 extends StatelessWidget {
  const ProductCard4(
      {Key? key,
      this.name,
      this.short,
      this.price,
      this.cutPrice,
      this.discount,
      this.image,
      required this.sizes})
      : super(key: key);

  final name;
  final short;
  final price;
  final cutPrice;
  final discount;
  final image;
  final List<String> sizes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.31,
      color: Colors.white,
      padding: EdgeInsets.only(top: 9),
      margin: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        AspectRatio(aspectRatio: 1, child: Image.asset(image)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(left: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(name, style: kProductCard4Name),
                            SizedBox(height: 7),
                            Text(short, style: kProductCard4Short),
                            SizedBox(height: 7),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text('$price ', style: kProductCard4Price),
                                Text('$cutPrice ',
                                    style: kProductCard4CutPrice),
                                Text(' $discount off ',
                                    style: kProductCard4Discount)
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomDropDown(
                              items: ['1', '2', '3'],
                              type: 'Qty',
                            ),
                            SizedBox(width: 20),
                            CustomDropDown(
                              items: sizes,
                              type: 'Size',
                            )
                          ],
                        ),
                        Text('Delivery by tomorrow, Fri | ₹20 '),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ProductCard4Footer(),
          )
        ],
      ),
    );
  }
}

class ProductCard4Footer extends StatelessWidget {
  const ProductCard4Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!)),
      child: Row(
        children: [
          Expanded(
              child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete_outline,
                  color: Colors.grey,
                  size: 20,
                ),
                Text('Delete',
                    style: TextStyle(fontSize: 16, color: Colors.black54)),
              ],
            ),
          )),
          Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey[200]!),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  Text(
                    'Add to Wishlist',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/screens/main_screen.dart';
import 'package:go_green/UI/screens/productDescription_screen.dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/backend/provider/firebase/idCollections.dart';
import 'package:go_green/main.dart';
import 'package:transparent_image/transparent_image.dart';

import '../customSnackBar.dart';

class ProductCard5 extends StatelessWidget {
  const ProductCard5({required this.product});
  final Product product;

  Future<void> _onRemove(BuildContext context) async {
    await removeFromCollection('Wishlist', product.id);
    Navigator.of(context).push(PageRouteBuilder(
      settings: RouteSettings(arguments: ScreenArguments(index: 2)),
      pageBuilder: (context, animation, secondaryAnimation) => MainScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    ));
  }

  Future<void> _addToCart(BuildContext context) async {
    bool result = await addToIdCollection('Cart', product.id);
    if (result) {
      _onRemove(context);
    }
    CustomSnackWidgets.buildErrorSnackBar(
        context, result ? 'Added to Cart' : 'Already in Cart');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDescriptionScreen.id,
              arguments: ScreenArguments(product: product));
        },
        child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.only(left: 2, bottom: 2),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[200]!),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Stack(children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: FadeInImage.memoryNetwork(
                            fit: BoxFit.fitHeight,
                            placeholder: kTransparentImage,
                            image: product.image[0]))),
                Positioned(
                    right: 3,
                    top: 3,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            border: Border.all(width: 0.5)),
                        child: GestureDetector(
                            onTap: () {
                              _onRemove(context);
                            },
                            child: Icon(Icons.close_sharp,
                                color: Colors.black54, size: 20))))
              ]),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    product.name,
                                    style: kProductCardName,
                                    overflow: TextOverflow.clip,
                                    softWrap: false,
                                  ),
                                  Text(
                                      product.short != 'null'
                                          ? product.short
                                          : 'Good',
                                      style: kProductCardShort),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {
                                      _addToCart(context);
                                    },
                                    icon: Icon(Icons.add_shopping_cart),
                                    iconSize: 20))
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text('₹${product.price}',
                                  maxLines: 1, style: kProductCardPrice),
                              product.discount != '0'
                                  ? Text('₹${product.cutPrice} ',
                                      maxLines: 1, style: kProductCardCutPrice)
                                  : Container(),
                              SizedBox(width: 5),
                              product.discount != '0'
                                  ? Text('${product.discount}% OFF ',
                                      maxLines: 1, style: kProductCardDiscount)
                                  : Container()
                            ])
                      ]))
            ])));
  }
}
// }

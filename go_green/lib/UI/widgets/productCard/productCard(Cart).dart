import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/screens/loadingBeforeCartScreen.dart';
import 'package:go_green/UI/screens/productDescription_screen.dart';
import 'package:go_green/UI/widgets/cartScreen/customDropDown.dart';
import 'package:go_green/UI/widgets/productDescrip/sellerInfo.dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/backend/provider/firebase/idCollections.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../main.dart';

class ProductCard4 extends StatelessWidget {
  const ProductCard4({required this.product, this.callback});
  final callback;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDescriptionScreen.id,
              arguments: ScreenArguments(product: product));
        },
        child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            color: Colors.white,
            padding: EdgeInsets.only(top: 9),
            margin: EdgeInsets.only(top: 8),
            child: Column(children: [
              Expanded(
                  flex: 5,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: FadeInImage.memoryNetwork(
                                      fit: BoxFit.fitHeight,
                                      placeholder: kTransparentImage,
                                      image: product.image[0])),
                            )),
                        Expanded(
                            flex: 3,
                            child: Container(
                                margin: EdgeInsets.only(left: 10, bottom: 10),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(product.name,
                                                style: kProductCard4Name),
                                            SizedBox(height: 7),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                children: [
                                                  Text('₹${product.price}',
                                                      style:
                                                          kProductCard4Price),
                                                  product.discount != '0'
                                                      ? Text(
                                                          '₹${product.cutPrice} ',
                                                          style:
                                                              kProductCard4CutPrice)
                                                      : Container(),
                                                  product.discount != '0'
                                                      ? Text(
                                                          '${product.discount}% OFF ',
                                                          style:
                                                              kProductCard4Discount)
                                                      : Container()
                                                ])
                                          ]),
                                      Row(children: [
                                        CustomDropDown(
                                            items: ['1', '2', '3', '4', '5'],
                                            type: 'Qty',
                                            callBack: (value) {
                                              callback(value);
                                            })
                                      ]),
                                      SellerInfo(sellerId: product.sellerId)
                                    ])))
                      ])),
              Expanded(flex: 1, child: ProductCard4Footer(id: product.id))
            ])));
  }
}

class ProductCard4Footer extends StatelessWidget {
  final id;
  const ProductCard4Footer({this.id});

  void _onDelete(BuildContext context) {
    removeFromCollection('Cart', id);
    Navigator.pushReplacement(context, noAnimationRoute(CartLoadingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onDelete(context);
      },
      child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey[200]!)),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Icon(Icons.delete_outline, color: Colors.grey, size: 20),
            Text('Delete',
                style: TextStyle(fontSize: 16, color: Colors.black54)),
            SizedBox(width: 20)
          ])),
    );
  }
}

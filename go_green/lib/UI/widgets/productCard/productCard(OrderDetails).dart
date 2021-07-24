import 'package:flutter/material.dart';
import 'package:go_green/backend/models/orderObject.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard6 extends StatelessWidget {
  const ProductCard6({Key? key, required this.orderItem}) : super(key: key);
  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 7),
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.19,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                    flex: 3,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(orderItem.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                          Text('Rs${orderItem.price}',
                              style: TextStyle(fontSize: 17)),
                          Text('Status: ${orderItem.status}',
                              style: TextStyle(color: Colors.green))
                        ])),
                Expanded(
                    flex: 2,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: FadeInImage.memoryNetwork(
                                fit: BoxFit.fitHeight,
                                placeholder: kTransparentImage,
                                image: orderItem.image))))
              ]))
        ]));
  }
}

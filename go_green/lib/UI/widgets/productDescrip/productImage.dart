import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'images/product.webp',
  'images/product.jpeg',
  'images/product.jpeg',
];

class ProductImage extends StatefulWidget {
  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        CarouselSlider(
            items: imgList
                .map((e) => Image.asset(
                      e,
                    ))
                .toList(),
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.5,
                viewportFraction: 1)),
        Positioned(
            right: 10,
            bottom: 10,
            child: ElevatedButton(
                child: Icon(Icons.share, color: Colors.black),
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(CircleBorder()),
                    backgroundColor: MaterialStateProperty.all(Colors.white))))
      ],
    );
  }
}

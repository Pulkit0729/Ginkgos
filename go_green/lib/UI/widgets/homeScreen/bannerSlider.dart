import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    Key? key,
    required this.imgList,
  }) : super(key: key);
  final List<String> imgList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: CarouselSlider(
          items: imgList
              .map((e) => Image.asset(
                    e,
                  ))
              .toList(),
          options: CarouselOptions(
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2))),
    );
  }
}
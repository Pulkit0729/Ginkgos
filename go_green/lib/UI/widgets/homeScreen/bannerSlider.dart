import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    required this.imgList,
  });
  final List<String> imgList;
  @override
  Widget build(BuildContext context) {
    print(imgList);
    return Stack(alignment: Alignment.center, children: [
      CarouselSlider(
          items: imgList.map((e) => Image.network(e)).toList(),
          options: CarouselOptions(
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2)))
    ]);
  }
}

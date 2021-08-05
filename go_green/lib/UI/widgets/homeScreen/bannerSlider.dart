import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    required this.imgList,
  });
  final List<String> imgList;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: imgList
            .map((e) => Stack(
                  children: [
                    CustomLoader(),
                    Image.network(e),
                  ],
                ))
            .toList(),
        options: CarouselOptions(
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2)));
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/photoView.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({required this.imgList});
  final List<dynamic> imgList;
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: imgList
            .map((e) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotoViewScreen(
                                imgList: imgList,
                              )));
                },
                child: Stack(
                  children: [
                    Center(child: CustomLoader()),
                    Center(child: Image.network(e)),
                  ],
                )))
            .toList(),
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.5,
            viewportFraction: 1));
  }
}

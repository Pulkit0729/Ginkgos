import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/widgets/homeScreen/bannerSlider.dart';
import 'package:go_green/widgets/homeScreen/homeLayout1.dart';

final List<String> imgList = [
  'images/banner.png',
  'images/banner.png',
  'images/banner.png',
];
final List<String> images = [
  'images/product.webp',
  'images/product.webp',
  'images/product.webp',
  'images/product.webp'
];
final List<String> name = ['Croton', 'Croton', 'Croton', 'Croton'];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BannerSlider(imgList: imgList),
        HomeLayout1(
          name: name,
          images: images,
          heading: 'Deals of the Day',
          function: () {},
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/UI/widgets/categoryTile.dart';
import 'package:go_green/backend/models/category.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> items = [
    Category(
        title: 'Ornamentals',
        subTitle: 'All decoratives',
        image: 'images/category/ornaBanner.png'),
    Category(
        title: 'Flowers',
        subTitle: 'All decoratives',
        image: 'images/category/flower_banner.png'),
    Category(
        title: 'Medicinal',
        subTitle: 'All decoratives',
        image: 'images/category/medicine_banner.png'),
    Category(
        title: 'Fruits',
        subTitle: 'All decoratives',
        image: 'images/category/fruit_banner.png'),
    Category(
        title: 'Pots',
        subTitle: 'All decoratives',
        image: 'images/category/pot_banner.png'),
    Category(
        title: 'Accessories',
        subTitle: 'All decoratives',
        image: 'images/category/accessory_banner.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryTile(
            category: items[index],
          );
        });
  }
}

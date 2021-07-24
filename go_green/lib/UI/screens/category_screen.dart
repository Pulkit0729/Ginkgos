import 'package:flutter/material.dart';
import 'package:go_green/UI/widgets/categoryTile.dart';
import 'package:go_green/backend/models/category.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> items = [
    Category(
        title: 'Ornamentals',
        subTitle: 'All decoratives',
        color: Color(0xC1EAAEE8)),
    Category(
      title: 'Flowers',
      subTitle: 'All decoratives',
      color: Color(0xC1EAAEE8),
    ),
    Category(
      title: 'Fruits',
      subTitle: 'All decoratives',
      color: Color(0xC1EAAEE8),
    ),
    Category(
      title: 'Medicinal',
      subTitle: 'All decoratives',
      color: Color(0xC1EAAEE8),
    ),
    Category(
      title: 'Pots',
      subTitle: 'All decoratives',
      color: Color(0xC1EAAEE8),
    ),
    Category(
      title: 'Accessories',
      subTitle: 'All decoratives',
      color: Color(0xC1EAAEE8),
    ),
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

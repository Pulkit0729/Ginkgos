import 'package:flutter/material.dart';
import 'package:go_green/UI/widgets/categoryTile.dart';
import 'package:go_green/backend/models/category.dart';

class CategoryScreen extends StatelessWidget {
  List<Category> items = [
    Category(
        title: 'Ornamental',
        subTitle: 'All decoratives',
        color: Colors.blue,
        subCategories: [
          SubCategory(title: 'One', id: 'O01'),
          SubCategory(title: 'Two', id: 'O02')
        ]),
    Category(
        title: 'Flowers',
        subTitle: 'All decoratives',
        color: Colors.blue,
        subCategories: [
          SubCategory(title: 'One', id: 'F01'),
          SubCategory(title: 'Two', id: 'F02')
        ]),
    Category(
        title: 'Fruits',
        subTitle: 'All decoratives',
        color: Colors.blue,
        subCategories: [
          SubCategory(title: 'One', id: 'FR01'),
          SubCategory(title: 'Two', id: 'FR02')
        ]),
    Category(
        title: 'Medicinal',
        subTitle: 'All decoratives',
        color: Colors.blue,
        subCategories: [
          SubCategory(title: 'One', id: 'M01'),
          SubCategory(title: 'Two', id: 'M02')
        ]),
    Category(
        title: 'Pots',
        subTitle: 'All decoratives',
        color: Colors.blue,
        subCategories: [
          SubCategory(title: 'One', id: 'P01'),
          SubCategory(title: 'Two', id: 'P02')
        ]),
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

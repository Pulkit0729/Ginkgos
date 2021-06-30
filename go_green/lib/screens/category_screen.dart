import 'package:flutter/material.dart';
import 'package:go_green/widgets/categoryTile.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> items = [
    'Ornamentals',
    'FLowers',
    'Medicinal',
    'Seeds',
    'Fruits',
    'Pots'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryTile(
            list: ['Indoors', 'Outdoor', 'Flowers'],
            heading: items[index],
            color: Colors.orange[(index + 1) * 100],
            subheading: 'New',
          );
        });
  }
}

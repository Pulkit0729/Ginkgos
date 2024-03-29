import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/productListScreen.dart';

class CategoryLayout extends StatelessWidget {
  const CategoryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('   Categories', style: TextStyle(fontSize: 20)),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        CircleCategory(
                            name: 'Ornamentals',
                            image: 'images/categoryLayout/ornamental.jpeg'),
                        CircleCategory(
                            name: 'Flowers',
                            image: 'images/categoryLayout/flower.jpeg'),
                        CircleCategory(
                            name: 'Fruits',
                            image: 'images/categoryLayout/fruit.jpeg'),
                      ])),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        CircleCategory(
                            name: 'Medicinal',
                            image: 'images/categoryLayout/medicinal.jpeg'),
                        CircleCategory(
                            name: 'Pots',
                            image: 'images/categoryLayout/pots.jpeg'),
                        CircleCategory(
                            name: 'Accessories',
                            image: 'images/categoryLayout/accessory.jpg'),
                      ]))
                ])));
  }
}

class CircleCategory extends StatelessWidget {
  const CircleCategory({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductListScreen(
                  name: name, type: ProductListScreen.category)));
        },
        child: Column(children: [
          CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.06,
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.white),
          Text(name)
        ], mainAxisAlignment: MainAxisAlignment.center));
  }
}

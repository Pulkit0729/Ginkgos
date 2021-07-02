import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/widgets/appBar3.dart';
import 'package:go_green/widgets/productCard/productCard.dart';
import 'package:go_green/widgets/productList/productListFooter.dart';

class ProductListScreen extends StatelessWidget {
  static String id = 'productList';
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar3(
        title: 'Product List',
      ),
      body: ListView(
        children: [Experiment(), Experiment(), Experiment()],
      ),
      bottomNavigationBar: ProductListFooter(),
    );
  }
}

class Experiment extends StatelessWidget {
  const Experiment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ProductCard(
          name: 'Croton',
          short: 'Indoor Plant',
          price: '150',
          cutPrice: '250',
          discount: '40',
          image: 'images/product.jpeg',
        )),
        Expanded(
          child: ProductCard(
            name: 'Croton',
            short: 'Indoor Plant',
            price: '150',
            cutPrice: '250',
            discount: '40',
            image: 'images/product.jpg',
          ),
        ),
      ],
    );
  }
}

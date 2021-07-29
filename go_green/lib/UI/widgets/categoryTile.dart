import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/screens/productListScreen.dart';
import 'package:go_green/backend/models/category.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            margin: EdgeInsets.only(top: 1),
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(category.image))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.title.toUpperCase(), style: kCategoryTitle),
                  Text(category.subTitle)
                ])),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductListScreen(
                    name: category.title,
                    type: ProductListScreen.category,
                  )));
        });
  }
}

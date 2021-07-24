import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/screens/productListScreen.dart';
import 'package:go_green/backend/models/category.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile({required this.category});
  final Category category;

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  String image = '';

  void _getImage() async {
    var image1 = await widget.category.readImage();
    setState(() {
      image = image1;
    });
  }

  @override
  void initState() {
    super.initState();
    _getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
          child: Container(
              margin: EdgeInsets.only(top: 1),
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.width * 0.33,
              decoration: image == ''
                  ? BoxDecoration(color: widget.category.color)
                  : BoxDecoration(
                      image: DecorationImage(image: NetworkImage(image)),
                      color: widget.category.color),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.category.title.toUpperCase(),
                        style: kCategoryTitle),
                    Text(widget.category.subTitle)
                  ])),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductListScreen(
                      name: widget.category.title,
                    )));
          })
    ]);
  }
}

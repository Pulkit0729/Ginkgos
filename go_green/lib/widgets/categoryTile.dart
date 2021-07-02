import 'package:flutter/material.dart';
import 'package:go_green/screens/productListScreen.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile({
    this.color,
    this.heading,
    this.subheading,
    required this.list,
  });
  final color;
  final heading;
  final subheading;
  final List<String> list;

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  late List<String> list1;

  @override
  void initState() {
    super.initState();
    list1 = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(top: 1),
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.width * 0.33,
            color: widget.color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.heading.toUpperCase(),
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                Text(widget.subheading)
              ],
            ),
          ),
          onTap: () {
            print("press");
            setState(() {
              list1.isEmpty ? list1.addAll(widget.list) : list1.clear();
              print(list1);
            });
          },
        ),
        Container(
            color: Colors.white,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: list1.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(list1[index]),
                    onTap: () {
                      Navigator.pushNamed(context, ProductListScreen.id);
                    },
                  );
                }))
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/screens/cart_screen.dart';

class AppBar3 extends StatelessWidget implements PreferredSizeWidget {
  const AppBar3({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title == null ? '' : title!),
      actions: [
        Container(
            width: MediaQuery.of(context).size.width / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    child: Icon(Icons.search, size: 26.0),
                    onTap: () {
                      Navigator.pushNamed(context, CartScreen.id);
                    }),
                GestureDetector(
                    child: Icon(Icons.shopping_cart, size: 26.0),
                    onTap: () {
                      Navigator.pushNamed(context, CartScreen.id);
                    }),
              ],
            ))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}

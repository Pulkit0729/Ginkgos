import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/search_screen.dart';

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  AppBar2(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SearchScreen.id);
              },
              child: Icon(Icons.search, size: 26.0),
            )),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}

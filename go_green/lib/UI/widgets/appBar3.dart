import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/cart_screen.dart';
import 'package:go_green/UI/screens/loadingBeforeCartScreen.dart';
import 'package:go_green/UI/screens/search_screen.dart';

import 'loginBottomSheet.dart';

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
                      Navigator.pushNamed(context, SearchScreen.id);
                    }),
                GestureDetector(
                    child: Icon(Icons.shopping_cart, size: 26.0),
                    onTap: () {
                      if (FirebaseAuth.instance.currentUser != null) {
                        Navigator.pushNamed(context, CartLoadingScreen.id);
                      } else {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return LoginBottomSheet();
                            });
                      }
                    }),
              ],
            ))
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}

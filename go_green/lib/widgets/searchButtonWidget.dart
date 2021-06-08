import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/screens/search_screen.dart';

class SearchButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, SearchScreen.id);
          },
          child: Row(
            children: [
              Icon(Icons.search),
              Expanded(child: Text('Search')),
            ],
          ),
        ));
  }
}

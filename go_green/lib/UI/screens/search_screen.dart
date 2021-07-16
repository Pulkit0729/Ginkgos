import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'Searchscreen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  print("cancel");
                },
              ),
              fillColor: Colors.white,
              filled: true),
        ),
      ),
    );
  }
}

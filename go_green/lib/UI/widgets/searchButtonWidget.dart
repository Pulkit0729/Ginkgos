import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/search_screen.dart';

class SearchButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.047,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 0),
      child: TextButton(
          child: Row(children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 10),
            Expanded(
                child: Text('Search Your Plant',
                    style: TextStyle(fontSize: 15, color: Colors.grey)))
          ]),
          onPressed: () {
            Navigator.pushNamed(context, SearchScreen.id);
          }),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(2)),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLayout2 extends StatelessWidget {
  final String? image;
  const HomeLayout2({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        child: Image.network(image!),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

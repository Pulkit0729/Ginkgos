import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLayout2 extends StatelessWidget {
  const HomeLayout2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        child: Image.asset('images/2.png'),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

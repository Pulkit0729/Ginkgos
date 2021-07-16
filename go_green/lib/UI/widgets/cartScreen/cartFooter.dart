import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({
    Key? key,
    this.text,
    this.function,
  }) : super(key: key);
  final text;
  final function;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextButton(
        onPressed: () {
          function();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kSecondaryColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

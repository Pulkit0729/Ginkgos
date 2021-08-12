import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.text, required this.function, this.color});
  final String text;
  final function;
  final color;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: MaterialButton(
            onPressed: function,
            child: Text(text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600))));
  }
}

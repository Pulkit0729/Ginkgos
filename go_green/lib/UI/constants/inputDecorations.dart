import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';

///Constant Box Decorations///
BoxDecoration pinPutDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(
    color: const Color.fromRGBO(126, 203, 224, 1),
  ),
);

///Constant Box Decorations End///
///Constant Input Field Decorations
InputDecoration kOtpInputDeco = InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1)));

InputDecoration kTextInputDeco = InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    filled: true,
    fillColor: Colors.white);

InputDecoration kErrorInputDeco = InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2)),
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    filled: true,
    fillColor: Colors.white);

///Add Address Input Field Decoration////

InputDecoration kAddressInputDeco = InputDecoration(
    labelStyle: kAddressLabel,
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!)),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)));

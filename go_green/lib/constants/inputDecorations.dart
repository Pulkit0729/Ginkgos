import 'package:flutter/material.dart';
import 'package:go_green/constants/textStyles.dart';

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

///Add Address Input Field Decoration////

InputDecoration kAddressInputDeco = InputDecoration(
    labelStyle: kAddressLabel,
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!)),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)));

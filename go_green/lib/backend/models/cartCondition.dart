import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';
import 'package:go_green/backend/models/priceDetailsObject.dart';

class CartConditions {
  final maxItems;
  final deliveryCharge;
  final minAmount;
  final maxDelivery;
  final dcNum;
  final noCod;

  CartConditions(
      {this.maxItems,
      this.deliveryCharge,
      this.dcNum,
      this.noCod,
      this.minAmount,
      this.maxDelivery});

  factory CartConditions.fromFirebase(json) {
    return CartConditions(
        dcNum: json['DCNumber'].toString(),
        deliveryCharge: json['DeliveryCharge'].toString(),
        noCod: json['NOCod'].toString(),
        minAmount: json['MinAmount'],
        maxDelivery: json['MaxDelivery'],
        maxItems: json['MaxItems']);
  }
}

Future<Map<String, dynamic>?> getCartConditions() async {
  return await FirebaseFirestore.instance
      .collection('Conditions')
      .doc('Condition')
      .get()
      .then((value) => value.data());
}

bool checkCartConditions(BuildContext context,
    {required PriceDetailsObject priceDetailsObject,
    required CartConditions cartConditions,
    required List sellerIds}) {
  num count = 0;
  sellerIds.forEach((element) {
    element == sellerIds[0] ? count = count + 1 : count = count;
  });

  if (count == sellerIds.length) {
    if (int.parse(priceDetailsObject.totalItems) >
        int.parse(cartConditions.maxItems)) {
      CustomSnackWidgets.buildErrorSnackBar(
          context, 'Maximum number of items exceeded');
      return false;
    } else {
      if (int.parse(priceDetailsObject.totalAmount) <
          int.parse(cartConditions.minAmount)) {
        CustomSnackWidgets.buildErrorSnackBar(
            context, 'Minimum Amount is ${cartConditions.minAmount}');
        return false;
      } else {
        return true;
      }
    }
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.close, size: 20)),
                ),
                Text(
                  'Items from different sellers can not be ordered at once.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ]));
        });
    return false;
  }
}

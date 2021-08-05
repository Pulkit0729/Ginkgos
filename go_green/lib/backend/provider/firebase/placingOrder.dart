import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_green/backend/models/orderObject.dart';
import 'package:go_green/backend/provider/firebase/idCollections.dart';
import 'package:go_green/backend/provider/firebase/remote_config_service.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<bool> placeOrder(OrderObject orderObject, BuildContext context) async {
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child('OrdersV2');
  bool cond1 = await dbRef
      .child(orderObject.orderId)
      .set(orderObject.toJson())
      .then((value) => true)
      .onError((error, stackTrace) => false);

  if (cond1) {
    String _uid = FirebaseAuth.instance.currentUser!.uid;
    bool cond2 = await addToIdCollection('OrderIds', orderObject.orderId);
    if (cond2) {
      bool cond3 = await FirebaseFirestore.instance
          .collection('users')
          .doc(_uid)
          .collection('IdCollection')
          .doc('Cart')
          .delete()
          .then((value) => true)
          .onError((error, stackTrace) => false);
      bool cond4 =
          await addToSellers(orderObject.sellerId, orderObject.orderId);
      if (cond3 && cond4) {
        await sendMail(context, orderObject.orderId,
            orderObject.priceDetailsObject.totalAmount);
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    return false;
  }
}

Future<bool> addToSellers(String sellerId, String orderId) async {
  return await FirebaseFirestore.instance
      .collection('Sellers')
      .doc(sellerId)
      .collection('IdCollection')
      .doc('New')
      .set({orderId: orderId}, SetOptions(merge: true))
      .then((value) => true)
      .onError((error, stackTrace) => false);
}

Future<void> sendMail(
    BuildContext context, String orderId, String orderTotal) async {
  String _url =
      '${Provider.of<ServerConfig>(context, listen: false).ip.toString()}/api/v1/order/placed';
  print(_url);
  await http
      .post(Uri.parse(_url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'apikey': Provider.of<ServerConfig>(context, listen: false)
                .apiKey
                .toString()
          },
          body: jsonEncode(<String, dynamic>{
            'UserId': FirebaseAuth.instance.currentUser!.uid,
            'OrderId': orderId,
            'OrderTotal': orderTotal
          }))
      .onError((error, stackTrace) {
    print(error);
    return http.Response(json.encode('{"statusCode":"404"}'), 404);
  });
}

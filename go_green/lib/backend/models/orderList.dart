import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'orderObject.dart';

Future<Map<String, dynamic>?> getOrderIds() async {
  final _uid = FirebaseAuth.instance.currentUser!.uid;
  try {
    DocumentSnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(_uid)
        .collection('IdCollection')
        .doc('OrderIds')
        .get();
    if (snap.exists && snap.data().toString() != '{}') {
      return snap.data();
    } else {
      return {"Null": "Null"};
    }
  } catch (e) {
    print(e);
    return {"Null": "Null"};
  }
}

Future<List<OrderItem>> getListOfItems(List list) async {
  List<OrderItem> items = [];
  for (var i = 0; i < list.length; i++) {
    OrderObject obj = await retrieveOrder(list[i].toString());
    items.addAll(obj.orderItems);
  }
  return items;
}

Future<OrderObject> retrieveOrder(String id) async {
  return await FirebaseDatabase.instance
      .reference()
      .child('OrdersV2')
      .child(id)
      .get()
      .then((DataSnapshot? snapshot) => (OrderObject.fromJson(snapshot!)));
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

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

Future<List<Map<String, dynamic>>> getListOfItems(List list) async {
  List<Map<String, dynamic>> items = [];
  for (var i = 0; i < list.length; i++) {
    try {
      OrderObject obj = await retrieveOrder(list[i].toString());
      for (var i = 0; i < obj.orderItems.length; i++) {
        items.add({
          'orderItem': obj.orderItems[i],
          'status': obj.status,
          'orderObject': obj
        });
      }
    } catch (e) {
      print(e);
      continue;
    }
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

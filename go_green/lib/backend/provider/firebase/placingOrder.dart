import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:go_green/backend/models/orderObject.dart';
import 'package:go_green/backend/provider/firebase/idCollections.dart';

Future<bool> placeOrder(OrderObject orderObject) async {
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child('Experiment');
  print(orderObject.toJson());
  bool cond1 = await dbRef
      .child(orderObject.orderId)
      .set(orderObject.toJson())
      .then((value) => true)
      .onError((error, stackTrace) => false);

  if (cond1) {
    String _uid = FirebaseAuth.instance.currentUser!.uid;
    bool cond2 = await addToIdCollection('OrderIds', orderObject.orderId);
    if (cond2) {
      return await FirebaseFirestore.instance
          .collection('users')
          .doc(_uid)
          .collection('IdCollection')
          .doc('Cart')
          .delete()
          .then((value) => true)
          .onError((error, stackTrace) => false);
    } else {
      return false;
    }
  } else {
    return false;
  }
}

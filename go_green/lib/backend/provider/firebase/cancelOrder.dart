import 'package:firebase_database/firebase_database.dart';
import 'package:go_green/backend/models/cancelObject.dart';
import 'package:go_green/backend/models/orderObject.dart';

Future<void> cancelOrder(
    {required OrderObject orderObject,
    required CancelObject cancelObject}) async {
  await FirebaseDatabase.instance
      .reference()
      .child('OrdersV2')
      .child(orderObject.orderId.toString())
      .child('CancelObject')
      .set(cancelObject.toJson());
  await FirebaseDatabase.instance
      .reference()
      .child('OrdersV2')
      .child(orderObject.orderId.toString())
      .child('Status')
      .set('Cancelled');
}

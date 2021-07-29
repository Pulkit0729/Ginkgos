import 'package:cloud_firestore/cloud_firestore.dart';

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

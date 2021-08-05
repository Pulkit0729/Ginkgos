import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:go_green/backend/models/priceDetailsObject.dart';

class OrderObject {
  final String orderId;
  final String orderDate;
  final String modeOfPayment;
  final String sellerId;
  final String status;
  final String userId;
  final AddressObject addressObject;
  final List<OrderItem> orderItems;
  final PriceDetailsObject priceDetailsObject;

  OrderObject({
    required this.modeOfPayment,
    required this.orderId,
    required this.orderDate,
    required this.userId,
    required this.status,
    required this.addressObject,
    required this.orderItems,
    required this.priceDetailsObject,
    required this.sellerId,
  });
  factory OrderObject.fromJson(DataSnapshot json) {
    return OrderObject(
      modeOfPayment: json.value['ModeOfPayment'],
      orderId: json.value['OrderId'],
      orderDate: json.value['OrderDate'],
      priceDetailsObject:
          PriceDetailsObject.fromJson(json.value['PriceDetailObject']),
      addressObject: AddressObject.fromJson(json.value['AddressObject']),
      orderItems: buildOrderItemsExternal(
          json.value['OrderItems'], json.value['OrderId']),
      sellerId: json.value['SellerId'],
      status: json.value['Status'],
      userId: json.value['UserId'],
    );
  }
  Map<String, dynamic> toJson() => {
        "OrderId": orderId.toString(),
        "OrderDate": orderDate.toString(),
        "ModeOfPayment": modeOfPayment.toString(),
        "Status": status.toString(),
        "OrderItems": List.from(orderItems.map((x) => x.toJson())),
        "AddressObject": addressObject.toJson(),
        "PriceDetailObject": priceDetailsObject.toJson(),
        "SellerId": sellerId.toString(),
        "UserId": userId.toString()
      };
}

class OrderItem {
  final name;
  final price;
  final qty;
  final status;
  final itemId;
  final image;
  final orderId;
  final rating;

  OrderItem({
    this.orderId,
    this.name,
    this.price,
    this.status,
    this.itemId,
    this.image,
    this.rating,
    this.qty,
  });

  factory OrderItem.fromInternalJson(
      Map<Object?, Object?> json, String orderId, String qty) {
    print(json);
    return OrderItem(
      name: json['Name'],
      status: 'Pending Approval',
      qty: qty,
      rating: '0',
      itemId: json['ID'].toString(),
      orderId: orderId.toString(),
      image: jsonDecode(json['Images'].toString())[0],
      price: json['SellingPrice'].toString(),
    );
  }

  factory OrderItem.fromExternalJson(
      Map<Object?, Object?> json, String orderId) {
    return OrderItem(
        name: json['Name'],
        price: json['Price'],
        status: json['Status'],
        itemId: json['ItemId'],
        orderId: json['OrderId'],
        image: json['Image'],
        rating: json['Rating']);
  }

  Map<String, dynamic> toJson() => {
        "Name": name.toString(),
        "Price": price.toString(),
        "Qty": qty.toString(),
        "Status": status.toString(),
        "ItemId": itemId.toString(),
        "OrderId": orderId.toString(),
        "Image": image.toString(),
        "Rating": rating.toString()
      };
}

List<OrderItem> buildOrderItemsInternal(
    {required List list, required String orderId, required List qty}) {
  List<OrderItem> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(OrderItem.fromInternalJson(list[i], orderId, qty[i].toString()));
  }
  return result;
}

List<OrderItem> buildOrderItemsExternal(List list, String orderId) {
  List<OrderItem> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(OrderItem.fromExternalJson(list[i], orderId));
  }
  return result;
}

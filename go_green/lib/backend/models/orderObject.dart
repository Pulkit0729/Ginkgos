import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:go_green/backend/models/priceDetailsObject.dart';

class OrderObject {
  final String orderId;
  final String orderDate;
  final String modeOfPayment;
  final AddressObject addressObject;
  final List<OrderItem> orderItems;
  final PriceDetailsObject priceDetailsObject;

  OrderObject({
    required this.modeOfPayment,
    required this.orderId,
    required this.orderDate,
    required this.addressObject,
    required this.orderItems,
    required this.priceDetailsObject,
  });
  factory OrderObject.fromJson(DataSnapshot json) {
    print(json.value['OrderItems']);
    return OrderObject(
      modeOfPayment: json.value['ModeOfPayment'],
      orderId: json.value['OrderId'],
      orderDate: json.value['OrderDate'],
      priceDetailsObject:
          PriceDetailsObject.fromJson(json.value['PriceDetailObject']),
      addressObject: AddressObject.fromJson(json.value['AddressObject']),
      orderItems: buildOrderItemsExternal(
          json.value['OrderItems'], json.value['OrderId']),
    );
  }
  Map<String, dynamic> toJson() => {
        "OrderId": orderId.toString(),
        "OrderDate": orderDate.toString(),
        "ModeOfPayment": modeOfPayment.toString(),
        "OrderItems": List.from(orderItems.map((x) => x.toJson())),
        "AddressObject": addressObject.toJson(),
        "PriceDetailObject": priceDetailsObject.toJson(),
      };
}

class OrderItem {
  final name;
  final price;
  final status;
  final itemId;
  final image;
  final orderId;
  final rating;

  OrderItem(
      {this.orderId,
      this.name,
      this.price,
      this.status,
      this.itemId,
      this.image,
      this.rating});

  factory OrderItem.fromInternalJson(
      Map<Object?, Object?> json, String orderId) {
    return OrderItem(
      name: json['Name'],
      status: 'Pending Approval',
      rating: '0',
      itemId: json['ID'].toString(),
      orderId: orderId.toString(),
      image: jsonDecode(json['Images'].toString())[0],
      price: ((100 - double.parse(json['Discount'].toString())) *
              double.parse(json['CostPrice'].toString()) /
              100)
          .toStringAsFixed(0),
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
        "Status": status.toString(),
        "ItemId": itemId.toString(),
        "OrderId": orderId.toString(),
        "Image": image.toString(),
        "Rating": rating.toString()
      };
}

List<OrderItem> buildOrderItemsInternal(List list, String orderId) {
  List<OrderItem> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(OrderItem.fromInternalJson(list[i], orderId));
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

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_green/backend/provider/firebase/remote_config_service.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<void> onRate(BuildContext context, {rating, orderId, itemId}) async {
  var negRat;
  var _list = await FirebaseDatabase.instance
      .reference()
      .child('OrdersV2')
      .child(orderId.toString())
      .get()
      .then((DataSnapshot? value) => value!.value['OrderItems']);

  var _index = 0;
  for (var i = 0; i < _list.length; i++) {
    if (_list[i]['ItemId'] == itemId) {
      negRat = int.parse(_list[i]['Rating']);
      break;
    } else {
      i++;
      _index++;
    }
  }
  await FirebaseDatabase.instance
      .reference()
      .child('OrdersV2')
      .child(orderId.toString())
      .child('OrderItems')
      .child(_index.toString())
      .child('Rating')
      .set(rating.toString())
      .then((value) => print('Success'));
  await addRatingToServer(itemId, negRat, rating, context);
}

Future<bool> addRatingToServer(id, negRat, posRat, BuildContext context) async {
  String _url =
      '${Provider.of<ServerConfig>(context, listen: false).ip.toString()}/api/v1/product/$id/rating';
  final response = await http
      .patch(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'apikey': Provider.of<ServerConfig>(context, listen: false)
              .apiKey
              .toString()
        },
        body: jsonEncode(<String?, int?>{'negRat': negRat, 'posRat': posRat}),
      )
      .onError((error, stackTrace) =>
          http.Response(json.encode('{"statusCode":"404"}'), 404));

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

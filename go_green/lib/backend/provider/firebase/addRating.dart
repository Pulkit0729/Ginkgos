import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

Future<void> onRate({rating, orderId, itemId}) async {
  var negRat;
  var _list = await FirebaseDatabase.instance
      .reference()
      .child('Experiment')
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
      .child('Experiment')
      .child(orderId.toString())
      .child('OrderItems')
      .child(_index.toString())
      .child('Rating')
      .set(rating.toString())
      .then((value) => print('Success'));
  await addRatingToServer(itemId, negRat, rating);
}

Future<bool> addRatingToServer(id, negRat, posRat) async {
  String _url = 'http://13.127.160.96/api/v1/product/$id/rating';
  final response = await http
      .patch(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
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

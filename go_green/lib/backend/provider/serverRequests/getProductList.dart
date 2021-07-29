import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

Future<List<dynamic>> getItemsIdList(String id) async {
  ///Fetching id list from realtime database///
  var list = [];
  DatabaseReference _dbRef = FirebaseDatabase.instance.reference();
  await _dbRef
      .child('ProductsList')
      .child(id)
      .once()
      .then((DataSnapshot? snapshot) {
    snapshot!.value.forEach((a, b) => {list.add(b.toString())});
  });
  var result = list.toString().replaceAll('[', '(').replaceAll(']', ')');
  return await getProductsFromList(result);
}

Future<String> getFourItemsList(String id) async {
  ///Fetching id list from realtime database///
  var list = [];
  DatabaseReference _dbRef = FirebaseDatabase.instance.reference();
  await _dbRef
      .child('ProductsList')
      .child(id)
      .once()
      .then((DataSnapshot? snapshot) {
    snapshot!.value.forEach((a, b) => {list.add(b.toString())});
  });
  return list
      .sublist(0, 4)
      .toString()
      .replaceAll('[', '(')
      .replaceAll(']', ')');
}

Future<List<dynamic>> getProductsFromList(String list) async {
  ///Fetching list from server////
  String _url = "http://13.127.160.96/api/v1/productList";
  var data = await http.post(Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
      },
      body: jsonEncode(<String?, String?>{'list': list.toString()}));
  return jsonDecode(data.body);
}

Future<List<dynamic>> getProductsFromCategory(String category) async {
  late var cat;
  switch (category) {
    case 'Ornamentals':
      {
        cat = 'Ornamental';
      }
      break;
    case 'Flowers':
      {
        cat = 'Flower';
      }
      break;
    case 'Fruits':
      {
        cat = 'Fruit';
      }
      break;
    case 'Medicinal':
      {
        cat = 'Medicine';
      }
      break;
    case 'Pots':
      {
        cat = 'Pot';
      }
      break;
    case 'Accessories':
      {
        cat = 'Accessory';
      }
      break;
  }

  ///Fetching list from server////
  String _url = "http://13.127.160.96/api/v1/product/itemsList/$cat";
  var data = await http.get(Uri.parse(_url), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
  });
  return jsonDecode(data.body);
}

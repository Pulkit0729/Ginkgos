import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:http/http.dart' as http;

final auth = FirebaseAuth.instance.currentUser;
String _uid = auth!.uid.toString();

Future<bool> addAddress(AddressObject addressObject, String line) async {
  String _url = 'http://13.127.160.96/api/v1/user/$_uid/address/$line';
  final response = await http
      .patch(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
        },
        body: jsonEncode(<String?, String?>{
          'name': addressObject.name,
          'phone': addressObject.phone,
          'city': addressObject.city,
          'state': addressObject.state,
          'locality': addressObject.locality,
          'type': addressObject.type,
          'pincode': addressObject.pincode,
          'address': addressObject.address
        }),
      )
      .onError((error, stackTrace) =>
          http.Response(json.encode('{"statusCode":"404"}'), 404));

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<AddressObject> getAddress(String line) async {
  String _url = 'http://13.127.160.96/api/v1/user/$_uid/address/$line';
  final response = await http
      .get(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
        },
      )
      .onError((error, stackTrace) =>
          http.Response(json.encode('{"statusCode":"404"}'), 404))
      .timeout(Duration(seconds: 4));

  if (response.statusCode == 200 && response.body != '') {
    String _data = response.body;
    Map<String, dynamic> _decodeData = jsonDecode(_data);
    return AddressObject.fromJson(_decodeData);
  } else {
    return AddressObject(
        name: '',
        pincode: '',
        address: '',
        state: '',
        locality: '',
        phone: '',
        type: '',
        city: '');
  }
}

Future<bool> deleteAddress(String line) async {
  String _url = 'http://13.127.160.96/api/v1/user/$_uid/address/$line';
  final response = await http.delete(
    Uri.parse(_url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
    },
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

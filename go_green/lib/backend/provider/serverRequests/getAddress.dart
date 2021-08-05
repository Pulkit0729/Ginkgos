import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:go_green/backend/provider/firebase/remote_config_service.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

final auth = FirebaseAuth.instance.currentUser;
String _uid = auth!.uid.toString();

Future<bool> addAddress(
    AddressObject addressObject, String line, BuildContext context) async {
  String _url =
      '${Provider.of<ServerConfig>(context, listen: false).ip.toString()}/api/v1/user/$_uid/address/$line';
  final response = await http
      .patch(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'apikey': Provider.of<ServerConfig>(context, listen: false)
              .apiKey
              .toString()
        },
        body: jsonEncode(addressObject.toJson()),
      )
      .onError((error, stackTrace) =>
          http.Response(json.encode('{"statusCode":"404"}'), 404));

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<AddressObject> getAddress(String line, BuildContext context) async {
  String _url =
      '${Provider.of<ServerConfig>(context, listen: false).ip.toString()}/api/v1/user/$_uid/address/$line';
  final response = await http
      .get(
        Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'apikey':
              '${Provider.of<ServerConfig>(context, listen: false).apiKey.toString()}'
        },
      )
      .onError((error, stackTrace) =>
          http.Response(json.encode('{"statusCode":"404"}'), 404))
      .timeout(Duration(seconds: 4));

  if (response.statusCode == 200 && response.body != '') {
    Map<String, dynamic> _decodeData = jsonDecode(response.body);
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

Future<bool> deleteAddress(String line, BuildContext context) async {
  String _url =
      '${Provider.of<ServerConfig>(context, listen: false).ip.toString()}/api/v1/user/$_uid/address/$line';
  final response = await http.delete(
    Uri.parse(_url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'apikey':
          Provider.of<ServerConfig>(context, listen: false).apiKey.toString()
    },
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

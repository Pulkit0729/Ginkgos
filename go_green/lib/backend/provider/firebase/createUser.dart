import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_green/backend/provider/firebase/remote_config_service.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

final CollectionReference users =
    FirebaseFirestore.instance.collection('UsersV2');
final auth = FirebaseAuth.instance.currentUser;
String uid = auth!.uid;
Future<bool> addUser(String name, String email) async {
  return users
      .doc(uid)
      .set({
        'ID': uid,
        'Name': name,
        'Email': email,
        'Phone': auth!.phoneNumber,
      })
      .then((value) => true)
      .catchError((error) => false)
      .timeout(Duration(seconds: 2), onTimeout: () {
        return false;
      });
}

Future<bool> createUser(String name, String email, BuildContext context) async {
  final response = await http
      .post(
        Uri.parse(
            '${Provider.of<ServerConfig>(context, listen: false).ip.toString()}/api/v1/userdata/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'apikey': Provider.of<ServerConfig>(context, listen: false)
              .apiKey
              .toString()
        },
        body: jsonEncode(<String?, String?>{
          'id': uid,
          'phone': auth!.phoneNumber,
          'regdTime': DateTime.now().toString(),
          'name': name,
          'email': email,
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

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_green/backend/provider/firebase/remote_config_service.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<void> updateUser(String name, String email, BuildContext context) async {
  final _uid = FirebaseAuth.instance.currentUser!.uid;
  await FirebaseFirestore.instance
      .collection('users')
      .doc(_uid)
      .set({'Name': name, 'Email': email}, SetOptions(merge: true)).then(
          (value) async {
    await updateUserSQL(context, _uid, name, email);
  }).onError((error, stackTrace) {
    print(error);
  });
}

Future<void> updateUserSQL(
    BuildContext context, String id, String name, String email) async {
  String _url =
      '${Provider.of<ServerConfig>(context, listen: false).ip.toString()}/api/v1/update/userdata';
  var _data = await http.patch(Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'apikey':
            Provider.of<ServerConfig>(context, listen: false).apiKey.toString()
      },
      body: jsonEncode(<String?, String?>{
        'id': id,
        'name': name,
        'email': email,
      }));
}

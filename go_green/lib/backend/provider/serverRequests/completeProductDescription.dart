import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_green/backend/provider/firebase/remote_config_service.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<Map<String, dynamic>> getCompleteDescription(
    String id, BuildContext context) async {
  String _url =
      '${Provider.of<ServerConfig>(context, listen: false).ip.toString()}/api/v1/productDescription/$id';
  var _data = await http.get(Uri.parse(_url), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'apikey':
        Provider.of<ServerConfig>(context, listen: false).apiKey.toString()
  });
  return jsonDecode(_data.body)[0];
}

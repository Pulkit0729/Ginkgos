import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:go_green/backend/provider/firebase/remote_config_service.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<List<dynamic>> searchQuery(String text, BuildContext context) async {
  String _url =
      '${Provider.of<ServerConfig>(context, listen: false).ip.toString()}/api/v1/product/search';

  var data = await http.post(Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'apikey':
            Provider.of<ServerConfig>(context, listen: false).apiKey.toString()
      },
      body: jsonEncode(<String?, String?>{'query': text}));
  return jsonDecode(data.body);
}

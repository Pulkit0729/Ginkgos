import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> searchQuery(String text) async {
  String _url = 'http://13.127.160.96/api/v1/product/search';

  var data = await http.post(Uri.parse(_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
      },
      body: jsonEncode(<String?, String?>{'query': text}));
  return jsonDecode(data.body);
}

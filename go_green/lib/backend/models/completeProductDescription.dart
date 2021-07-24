import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getCompleteDescription(String id) async {
  String _url = 'http://13.127.160.96/api/v1/productDescription/$id';
  var _data = await http.get(Uri.parse(_url), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
  });
  return jsonDecode(_data.body)[0];
}

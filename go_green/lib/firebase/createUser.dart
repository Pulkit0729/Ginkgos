import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

final CollectionReference users =
    FirebaseFirestore.instance.collection('users');
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

Future<bool> createUser(String name, String email) async {
  final response = await http
      .post(
        Uri.parse('http://13.127.160.96/api/v1/userdata/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'apikey': '391cf50d-f146-4a25-9418-d556bdb32dd5'
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
    print(response.statusCode);
    return true;
  } else {
    print(response.statusCode);
    return false;
  }
}
//
// // To parse this JSON data, do
// //
// //     final useModel = useModelFromJson(jsonString);
//
// UseModel useModelFromJson(String str) => UseModel.fromJson(json.decode(str));
//
// String useModelToJson(UseModel data) => json.encode(data.toJson());
//
// class UseModel {
//   UseModel({
//     required this.fieldCount,
//     required this.affectedRows,
//     required this.insertId,
//     required this.serverStatus,
//     required this.warningCount,
//     required this.message,
//     required this.protocol41,
//     required this.changedRows,
//   });
//
//   int fieldCount;
//   int affectedRows;
//   int insertId;
//   int serverStatus;
//   int warningCount;
//   String message;
//   bool protocol41;
//   int changedRows;
//
//   factory UseModel.fromJson(Map<String, dynamic> json) => UseModel(
//         fieldCount: json["fieldCount"],
//         affectedRows: json["affectedRows"],
//         insertId: json["insertId"],
//         serverStatus: json["serverStatus"],
//         warningCount: json["warningCount"],
//         message: json["message"],
//         protocol41: json["protocol41"],
//         changedRows: json["changedRows"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "fieldCount": fieldCount,
//         "affectedRows": affectedRows,
//         "insertId": insertId,
//         "serverStatus": serverStatus,
//         "warningCount": warningCount,
//         "message": message,
//         "protocol41": protocol41,
//         "changedRows": changedRows,
//       };
// }

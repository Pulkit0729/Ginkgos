import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Category {
  Category({this.color, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  final Color? color;
  late String image;

  Future<String> readImage() async {
    final _db = FirebaseDatabase.instance;
    final _dbRef = _db.reference();
    String url = await _dbRef
        .child('CategoryImages')
        .get()
        .then((DataSnapshot? snapshot) {
      return snapshot!.value[title].toString();
    });
    _db.setPersistenceEnabled(true);
    _db.setPersistenceCacheSizeBytes(1000000);
    return url;
  }
}

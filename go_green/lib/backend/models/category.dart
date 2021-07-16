import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Category {
  Category(
      {this.color,
      required this.title,
      required this.subTitle,
      required this.subCategories});
  final String title;
  final String subTitle;
  final Color? color;
  late String image;
  final List<SubCategory> subCategories;

  Future<String> readData() async {
    final _db = FirebaseDatabase.instance;
    final _dbRef = _db.reference();
    String url = await _dbRef
        .reference()
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

class SubCategory {
  final String title;
  final String id;

  const SubCategory({required this.title, required this.id});
}

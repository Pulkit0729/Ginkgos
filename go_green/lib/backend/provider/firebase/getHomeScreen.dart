import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

Future<List<String>> getBanners({callback}) async {
  List<String> list = [];
  var extra = [];
  var featureBanner;
  var promoBanner;
  await FirebaseDatabase.instance
      .reference()
      .child('HomeLayout')
      .get()
      .then((value) {
        extra = value!.value['Banners'];
        featureBanner = value.value['FeatureBanner']['link'];
        promoBanner = value.value['PromoBanner']['link'];
      })
      .timeout(Duration(seconds: 8))
      .onError((error, stackTrace) {
        print(error);
        callback();
      });
  extra.forEach((e) => list.add(e.toString()));
  list.addAll([featureBanner, promoBanner]);
  return list;
}

Future<void> precacheBanners(String i, callback, context) async {
  await precacheImage(NetworkImage(i), context).then((value) => callback());
}

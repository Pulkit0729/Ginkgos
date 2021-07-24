import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

Future<List<String>> getBanners(
    {callback, required BuildContext context}) async {
  List<String> list = [];
  var extra = [];
  var featureBanner;
  await FirebaseDatabase.instance
      .reference()
      .child('HomeLayout')
      .get()
      .then((value) {
        extra = value!.value['Banners'];
        featureBanner = value.value['FeatureBanner']['link'];
      })
      .timeout(Duration(seconds: 3))
      .onError((error, stackTrace) {
        callback();
      });
  extra.forEach((e) => list.add(e.toString()));
  list.add(featureBanner);
  return precacheImage(NetworkImage(extra[0]), context).then((value) {
    callback();
    return list;
  });
}

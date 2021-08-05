import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';

class SellerInfo extends StatelessWidget {
  final sellerId;
  const SellerInfo({Key? key, this.sellerId}) : super(key: key);

  Future<dynamic> sellerData() async {
    return await FirebaseFirestore.instance
        .collection('Sellers')
        .doc(sellerId.toString())
        .get()
        .then((documentSnapshot) {
      return documentSnapshot.get(FieldPath(['NurseryName']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sellerData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black, fontSize: 16, fontFamily: 'Lato'),
                    children: <TextSpan>[
                  new TextSpan(text: 'Sold by '),
                  new TextSpan(
                      text: snapshot.data,
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                ]));
          } else {
            return Container();
          }
        } else {
          return SpinKitRing(color: kLoadingColor!, size: 12);
        }
      },
    );
  }
}

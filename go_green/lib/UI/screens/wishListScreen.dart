import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/screens/main_screen.dart';
import 'package:go_green/UI/screens/emptyScreen.dart';
import 'package:go_green/UI/widgets/productCard/productCard(Wishlist).dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/backend/provider/serverRequests/getProductList.dart';
import 'package:go_green/main.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('IdCollection')
            .doc('Wishlist')
            .get(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.data() != null &&
                snapshot.data.data().toString() != '{}') {
              return FutureBuilder(
                  future: getProductsFromList(
                      snapshot.data.data().values.toString()),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot1) {
                    if (snapshot1.hasData) {
                      return GridView.builder(
                          itemCount: snapshot1.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height /
                                              1.4)),
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard5(
                                product:
                                    Product.fromJson(snapshot1.data[index]));
                          });
                    } else {
                      return SpinKitCircle(color: Colors.blue);
                    }
                  });
            } else {
              return EmptyScreen(
                  function: () {
                    Navigator.pushNamed(context, MainScreen.id,
                        arguments: ScreenArguments(index: 1));
                  },
                  image: 'images/emptyWishlist.svg',
                  text: 'You have not selected any items for your wishlist.');
            }
          } else {
            return SpinKitCircle(color: Colors.blue);
          }
        });
  }
}

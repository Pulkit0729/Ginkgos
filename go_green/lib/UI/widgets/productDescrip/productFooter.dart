import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/main_screen.dart';
import 'package:go_green/backend/provider/firebase/idCollections.dart';
import 'package:go_green/main.dart';

import '../customSnackBar.dart';
import '../loginBottomSheet.dart';

class ProductFooter extends StatefulWidget {
  final id;

  const ProductFooter({Key? key, this.id}) : super(key: key);

  @override
  _ProductFooterState createState() => _ProductFooterState();
}

class _ProductFooterState extends State<ProductFooter> {
  bool isPressed = false;

  Future<void> _onClickWishlist(BuildContext context, String id) async {
    if (FirebaseAuth.instance.currentUser != null) {
      if (isPressed) {
        Navigator.pushNamed(context, MainScreen.id,
            arguments: ScreenArguments(index: 2));
      } else {
        bool result = await addToIdCollection('Wishlist', id);
        CustomSnackWidgets.buildErrorSnackBar(
            context, result ? 'Added to wishlist' : 'Already in Wishlist');
        setState(() {
          isPressed = true;
        });
      }
    } else {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return LoginBottomSheet();
          });
    }
  }

  Future<void> _onClickCart(BuildContext context, String id) async {
    if (FirebaseAuth.instance.currentUser != null) {
      bool result = await addToIdCollection('Cart', id);
      CustomSnackWidgets.buildErrorSnackBar(
          context, result ? 'Added to Cart' : 'Already in Cart');
    } else {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return LoginBottomSheet();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(7),
              child: TextButton(
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.grey.shade300))),
                onPressed: () {
                  _onClickWishlist(context, widget.id);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isPressed
                          ? Icon(Icons.favorite, color: Colors.pink)
                          : Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                            ),
                      Text(
                        isPressed ? 'WISHLISTED' : 'WISHLIST',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 7),
              child: TextButton(
                onPressed: () {
                  _onClickCart(context, widget.id);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(kSecondaryColor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    '🛒 Add to Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

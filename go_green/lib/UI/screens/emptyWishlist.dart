import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_green/UI/screens/main_screen.dart';

class EmptyWishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.popAndPushNamed(context, MainScreen.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                'images/emptyWishlist.svg',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You have not selected any items for your wishlist.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.5),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Shop Now',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.green,
                      fontWeight: FontWeight.w700),
                ))
          ],
        ),
      ),
    );
  }
}
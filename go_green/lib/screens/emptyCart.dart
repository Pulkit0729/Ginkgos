import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
import 'main_screen.dart';

class EmptyCart extends StatefulWidget {
  @override
  _EmptyCartState createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MainScreen.id,
            arguments: ScreenArguments(0));
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
              'You have not selected any items for your Cart.',
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
    );;
  }
}

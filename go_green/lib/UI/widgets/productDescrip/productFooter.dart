import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';

class ProductFooter extends StatelessWidget {
  const ProductFooter({
    Key? key,
  }) : super(key: key);

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
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    '🤍 WISHLIST',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 7),
              child: TextButton(
                onPressed: () {},
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

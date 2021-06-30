import 'package:flutter/material.dart';
import 'package:go_green/constants/textStyles.dart';
import 'package:go_green/screens/productDescription_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDescriptionScreen.id);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.grey[300]!),
                right: BorderSide(color: Colors.grey[300]!))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  'images/product.webp',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Croton', style: kProductCardName),
                      Text('Indooor PLant ', style: kProductCardShort),
                      SizedBox(height: 7),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('₹150 ', style: kProductCardPrice),
                          Text('250 ', style: kProductCardCutPrice),
                          Text(' 40% off ', style: kProductCardDiscount)
                        ],
                      ),
                    ],
                  ),
                  FavIconButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavIconButton extends StatefulWidget {
  const FavIconButton({
    Key? key,
  }) : super(key: key);
  @override
  _FavIconButtonState createState() => _FavIconButtonState();
}

class _FavIconButtonState extends State<FavIconButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: 30,
        height: 30,
        right: 0,
        top: 0,
        child: IconButton(
          onPressed: () {
            setState(() {
              isPressed ? isPressed = false : isPressed = true;
            });
          },
          icon: isPressed
              ? Icon(Icons.favorite, color: Colors.pink)
              : Icon(
                  Icons.favorite_border_outlined,
                ),
          iconSize: 20,
        ));
  }
}

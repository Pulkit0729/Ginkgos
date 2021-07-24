import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/screens/productDescription_screen.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';
import 'package:go_green/UI/widgets/loginBottomSheet.dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/backend/provider/firebase/idCollections.dart';
import 'package:go_green/main.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDescriptionScreen.id,
              arguments: ScreenArguments(product: product));
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey[300]!),
                    right: BorderSide(color: Colors.grey[300]!))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: FadeInImage.memoryNetwork(
                          fit: BoxFit.fitHeight,
                          placeholder: kTransparentImage,
                          image: product.image[0]))),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Row(children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              product.name,
                              style: kProductCardName,
                              maxLines: 1,
                            ),
                            Text(
                                product.short != 'null'
                                    ? product.short
                                    : 'Good',
                                style: kProductCardShort),
                            SizedBox(height: 7),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text('₹${product.price}',
                                      style: kProductCardPrice),
                                  Text('${product.cutPrice} ',
                                      style: kProductCardCutPrice),
                                  Text(' ${product.discount}% off ',
                                      style: kProductCardDiscount)
                                ])
                          ]),
                    ),
                    Expanded(
                      flex: 1,
                      child: FavIconButton(
                        id: product.id,
                      ),
                    )
                  ])),
            ])));
  }
}

class FavIconButton extends StatefulWidget {
  const FavIconButton({required this.id});
  final String id;
  @override
  _FavIconButtonState createState() => _FavIconButtonState();
}

class _FavIconButtonState extends State<FavIconButton> {
  bool isPressed = false;
  Future<void> _onClick() async {
    final _user = FirebaseAuth.instance.currentUser;
    if (_user == null) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return LoginBottomSheet();
          });
    } else {
      if (isPressed) {
        await removeFromCollection('Wishlist', widget.id);
        setState(() {
          isPressed = false;
        });
        CustomSnackWidgets.buildErrorSnackBar(context, 'Removed from Wishlist');
      } else {
        setState(() {
          isPressed = true;
        });
        bool result = await addToIdCollection('Wishlist', widget.id);
        CustomSnackWidgets.buildErrorSnackBar(
            context, result ? 'Added to wishlist' : 'Already in Wishlist');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _onClick();
        },
        icon: isPressed
            ? Icon(Icons.favorite, color: Colors.pink)
            : Icon(Icons.favorite_border_outlined),
        iconSize: 20);
  }
}

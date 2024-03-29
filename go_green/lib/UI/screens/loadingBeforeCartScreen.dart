import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/cart_screen.dart';
import 'package:go_green/UI/screens/emptyScreen.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/backend/models/cartItems.dart';
import 'package:go_green/main.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

class CartLoadingScreen extends StatefulWidget {
  static String id = 'cartLoading';
  @override
  _CartLoadingScreenState createState() => _CartLoadingScreenState();
}

class _CartLoadingScreenState extends State<CartLoadingScreen> {
  bool _isLoading = true;
  void _check() async {
    await Provider.of<CartItems>(context, listen: false).getCartItems();
    if (Provider.of<CartItems>(context, listen: false).exist) {
      Navigator.pushReplacement(context, noAnimationRoute(CartScreen()));
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: kScaffoldGrey,
        body: _isLoading
            ? CustomLoader()
            : EmptyScreen(
                text: 'You have not added any items in your cart.',
                function: () {
                  Navigator.popAndPushNamed(context, MainScreen.id,
                      arguments: ScreenArguments(index: 1));
                },
                image: 'images/svg/emptyWishlist.svg',
              ));
  }
}

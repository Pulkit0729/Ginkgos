import 'package:flutter/material.dart';
import 'package:go_green/screens/addAddress_screen.dart';
import 'package:go_green/screens/addressBook.dart';
import 'package:go_green/screens/help_screen.dart';
import 'package:go_green/screens/login_screen.dart';
import 'package:go_green/screens/main_screen.dart';
import 'package:go_green/screens/cart_screen.dart';
import 'package:go_green/screens/orders_screen.dart';
import 'package:go_green/screens/productDescription_screen.dart';
import 'package:go_green/screens/productListScreen.dart';
import 'package:go_green/screens/profile_screen.dart';
import 'package:go_green/screens/search_screen.dart';
import 'package:go_green/screens/selectAddressScreen.dart';
import 'package:go_green/screens/verifyName_screen.dart';
import 'package:go_green/screens/verifyOtp_screen.dart';
import 'package:go_green/screens/wishlist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      theme: ThemeData(
          fontFamily: 'Lato',
          primaryColor: Colors.green,
          primaryColorDark: Colors.green[700],
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.yellow)),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        MainScreen.id: (context) => MainScreen(),
        VerifyOtp.id: (context) => VerifyOtp(),
        NameScreen.id: (context) => NameScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        WishlistScreen.id: (context) => WishlistScreen(),
        ProductListScreen.id: (context) => ProductListScreen(),
        ProductDescriptionScreen.id: (context) => ProductDescriptionScreen(),
        CartScreen.id: (context) => CartScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        OrderScreen.id: (context) => OrderScreen(),
        HelpScreen.id: (context) => HelpScreen(),
        AddressBookScreen.id: (context) => AddressBookScreen(),
        AddAddressScreen.id: (context) => AddAddressScreen(),
        SelectAddressScreen.id: (context) => SelectAddressScreen(),
      },
    );
  }
}

Route noAnimationRoute(route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

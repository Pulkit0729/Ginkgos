import 'package:flutter/material.dart';
import 'package:go_green/screens/help_screen.dart';
import 'package:go_green/screens/login_screen.dart';
import 'package:go_green/screens/main_screen.dart';
import 'package:go_green/screens/cart_screen.dart';
import 'package:go_green/screens/orders_screen.dart';
import 'package:go_green/screens/profile_screen.dart';
import 'package:go_green/screens/search_screen.dart';
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
      theme: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.green[700],
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.yellow),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        MainScreen.id: (context) => MainScreen(),
        VerifyOtp.id: (context) => VerifyOtp(),
        NameScreen.id: (context) => NameScreen(),
        CartScreen.id: (context) => CartScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        WishlistScreen.id: (context) => WishlistScreen(),
        OrderScreen.id: (context) => OrderScreen(),
        HelpScreen.id: (context) => HelpScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    );
  }
}

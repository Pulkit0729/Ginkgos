// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/addAddress_screen.dart';
import 'package:go_green/UI/screens/addressBook.dart';
import 'package:go_green/UI/screens/help_screen.dart';
import 'package:go_green/UI/screens/loadingScreen.dart';
import 'package:go_green/UI/screens/login_screen.dart';
import 'package:go_green/UI/screens/main_screen.dart';
import 'package:go_green/UI/screens/cart_screen.dart';
import 'package:go_green/UI/screens/orderDetailsScreen.dart';
import 'package:go_green/UI/screens/orders_screen.dart';
import 'package:go_green/UI/screens/productDescription_screen.dart';
import 'package:go_green/UI/screens/productListScreen.dart';
import 'package:go_green/UI/screens/profile_screen.dart';
import 'package:go_green/UI/screens/search_screen.dart';
import 'package:go_green/UI/screens/selectAddressScreen.dart';
import 'package:go_green/UI/screens/verifyName_screen.dart';
import 'package:go_green/UI/screens/verifyOtp_screen.dart';
import 'package:go_green/UI/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';

import 'backend/models/userdata.dart';
import 'backend/utilities/locFromPin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Userdata()),
    ChangeNotifierProvider(create: (context) => LocFromPin())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          auth.currentUser == null ? LoginScreen.id : LoadingScreen.id,
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
        LoadingScreen.id: (context) => LoadingScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        WishlistScreen.id: (context) => WishlistScreen(),
        ProductListScreen.id: (context) => ProductListScreen(),
        ProductDescriptionScreen.id: (context) => ProductDescriptionScreen(),
        CartScreen.id: (context) => CartScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        OrderScreen.id: (context) => OrderScreen(),
        OrderDetailsScreen.id: (context) => OrderDetailsScreen(),
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

class ScreenArguments {
  final int? index;
  final String? phone;
  ScreenArguments({this.index, this.phone});
}

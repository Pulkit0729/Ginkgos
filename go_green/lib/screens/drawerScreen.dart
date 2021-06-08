import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/components/drawerItems.dart';
import 'package:go_green/screens/help_screen.dart';
import 'package:go_green/screens/login_screen.dart';
import 'package:go_green/screens/main_screen.dart';
import 'package:go_green/screens/cart_screen.dart';
import 'package:go_green/screens/orders_screen.dart';
import 'package:go_green/screens/profile_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<NavItem> drawerItems = [
      NavItem('Log In', () {
        Navigator.popAndPushNamed(context, LoginScreen.id);
      }),
      NavItem('My Profile', () {
        Navigator.popAndPushNamed(context, ProfileScreen.id);
      }),
      NavItem('My Orders', () {
        Navigator.popAndPushNamed(context, OrderScreen.id);
      }),
      NavItem('My Cart', () {
        Navigator.popAndPushNamed(context, CartScreen.id);
      }),
      NavItem('My Wishlist', () {
        Navigator.popAndPushNamed(context, MainScreen.id,
            arguments: ScreenArguments(2));
      }),
      NavItem('Shop By Categories', () {
        Navigator.popAndPushNamed(context, MainScreen.id,
            arguments: ScreenArguments(1));
      }),
      NavItem('Help', () {
        Navigator.popAndPushNamed(context, HelpScreen.id);
      }),
      NavItem('Share Us', () {}),
      NavItem('Feedback', () {}),
      NavItem('Social Media', () {}),
      NavItem('Log Out', () {}),
    ];
    AnotherList anotherList = AnotherList(drawerItems);
    var drawerList = anotherList.getItems();
    return Drawer(
        child: ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: drawerList.length,
      itemBuilder: (context, index) {
        final item = drawerList[index];
        return ListTile(
          title: item.buildHeader(context),
          subtitle: item.buildItems(context),
        );
      },
    ));
  }
}

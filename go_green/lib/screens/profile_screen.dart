import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/screens/addressBook.dart';
import 'package:go_green/screens/orders_screen.dart';
import 'package:go_green/widgets/profile/profileHeader.dart';
import 'package:go_green/widgets/profile/profileTile.dart';

class ProfileScreen extends StatelessWidget {
  static String id = 'profileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: ListView(children: [
          ProfileHeader(),
          ProfileItem(
            text: 'My Orders',
            iconData: Icons.shopping_bag_outlined,
            function: () {
              Navigator.pushNamed(context, OrderScreen.id);
            },
          ),
          ProfileItem(
              text: 'Address Book',
              iconData: Icons.book_outlined,
              function: () {
                Navigator.pushNamed(context, AddressBookScreen.id);
              }),
          ProfileItem(
            text: 'Edit Profile',
            iconData: Icons.settings,
          ),
          ProfileItem(
            text: 'Rate Us',
            iconData: Icons.rate_review_outlined,
          ),
          ProfileItem(
            text: 'Log Out',
            iconData: Icons.logout,
          ),
        ]));
  }
}

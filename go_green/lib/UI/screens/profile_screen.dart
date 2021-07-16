import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/backend/models/userdata.dart';
import 'package:go_green/UI/screens/addressBook.dart';
import 'package:go_green/UI/screens/login_screen.dart';
import 'package:go_green/UI/screens/orders_screen.dart';
import 'package:go_green/UI/widgets/profile/profileHeader.dart';
import 'package:go_green/UI/widgets/profile/profileTile.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static String id = 'profileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
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
            function: () {
              Provider.of<Userdata>(context, listen: false).dispose();
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.id, (route) => false);
            },
          ),
        ]));
  }
}

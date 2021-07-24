import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/addressBook.dart';
import 'package:go_green/UI/screens/login_screen.dart';
import 'package:go_green/UI/screens/orders_screen.dart';
import 'package:go_green/UI/widgets/profileHeader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  Future<void> _deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
    final appDir = await getApplicationSupportDirectory();
    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

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
              }),
          ProfileItem(
              text: 'Address Book',
              iconData: Icons.book_outlined,
              function: () {
                Navigator.pushNamed(context, AddressBookScreen.id);
              }),
          ProfileItem(
              text: 'Edit Profile',
              iconData: Icons.settings,
              function: () async {
                await FirebaseDatabase.instance
                    .reference()
                    .child('HomeLayout')
                    .get()
                    .then((value) => print(value!.value['Banners']));
              }),
          ProfileItem(
              text: 'Rate Us',
              iconData: Icons.rate_review_outlined,
              function: () async {
                if (await canLaunch(
                    'https://play.google.com/store/apps/details?id=com.last.go_green')) {
                  await launch(
                      'https://play.google.com/store/apps/details?id=com.last.go_green');
                } else {
                  throw 'Could not launch';
                }
              }),
          ProfileItem(
              text: 'Log Out',
              iconData: Icons.logout,
              function: () {
                FirebaseAuth.instance.signOut();
                _deleteCacheDir();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.id, (route) => false);
              })
        ]));
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({this.iconData, this.text, this.function});
  final iconData;
  final text;
  final function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey[200]!,
            child: Icon(iconData, color: kProfileItemsIcon)),
        title: Text(text),
        onTap: function);
  }
}

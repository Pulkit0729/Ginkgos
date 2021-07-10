import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/constants/textStyles.dart';
import 'package:go_green/models/userdata.dart';
import 'package:go_green/screens/main_screen.dart';
import 'package:go_green/screens/orders_screen.dart';
import 'package:go_green/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'login_screen.dart';

class NavDrawer extends StatelessWidget {
  final _currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        _currentUser != null ? DrawerHeader0() : DrawerHeader1(),
        DrawerTile(
            title: 'My Profile',
            iconData: Icons.account_circle_sharp,
            route: _currentUser != null ? ProfileScreen.id : LoginScreen.id),
        DrawerTile(
            title: 'My Orders',
            iconData: Icons.all_inbox_outlined,
            route: _currentUser != null ? OrderScreen.id : LoginScreen.id),
        DrawerTile(
            title: 'Shop By Categories',
            iconData: Icons.category_outlined,
            route: MainScreen.id,
            arguments: ScreenArguments(index: 1)),
        ListTile(
            title: Text('Help'), leading: SizedBox(), horizontalTitleGap: 0),
        ListTile(
            title: Text('Feedback'),
            leading: SizedBox(),
            horizontalTitleGap: 0),
        ListTile(
            title: Text('Social Media'),
            leading: SizedBox(),
            horizontalTitleGap: 0),
      ],
    ));
  }
}

class DrawerHeader0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
          color: Colors.orange[200],
          border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
      padding: EdgeInsets.only(
          left: 20, top: MediaQuery.of(context).size.height * 0.03, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              backgroundImage: AssetImage('images/product.jpeg'),
              radius: MediaQuery.of(context).size.height * 0.05),
          Padding(
              padding: EdgeInsets.only(left: 7),
              child: GestureDetector(
                child: Text(
                  'Welcome, ${Provider.of<UserName>(context, listen: false).name}',
                  style: kUserName,
                ),
                onTap: () {
                  Navigator.pushNamed(context, ProfileScreen.id);
                },
              )),
        ],
      ),
    );
  }
}

class DrawerHeader1 extends StatelessWidget {
  const DrawerHeader1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
          color: Colors.orange[200],
          border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
              backgroundImage: AssetImage('images/product.jpeg'), radius: 35),
          Padding(
              padding: EdgeInsets.only(left: 7),
              child: GestureDetector(
                child: Text('Log In | Sign Up'),
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              )),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    this.title,
    this.iconData,
    this.route,
    this.arguments,
  }) : super(key: key);
  final title;
  final iconData;
  final route;
  final arguments;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
      child: ListTile(
        title: Text(title),
        leading: Icon(
          iconData,
          color: Colors.black,
        ),
        horizontalTitleGap: 0,
        onTap: () {
          Navigator.pushNamed(context, route, arguments: arguments);
        },
      ),
    );
  }
}

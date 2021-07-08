import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/screens/main_screen.dart';
import 'package:go_green/screens/orders_screen.dart';
import 'package:go_green/screens/profile_screen.dart';

import '../main.dart';
import 'login_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.orange[200],
              border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
          padding: EdgeInsets.only(top: 25, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/product.jpeg'),
                radius: 35,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: GestureDetector(
                    child: Text('Log In | Sign Up'),
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  )),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
          child: ListTile(
            title: Text('My Profile'),
            leading: Icon(
              Icons.account_circle_sharp,
              color: Colors.black,
            ),
            horizontalTitleGap: 0,
            onTap: () {
              Navigator.pushNamed(context, ProfileScreen.id);
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
          child: ListTile(
            title: Text('My Orders'),
            leading: Icon(
              Icons.all_inbox,
              color: Colors.black,
            ),
            horizontalTitleGap: 0,
            onTap: () {
              Navigator.pushNamed(context, OrderScreen.id);
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
          child: ListTile(
            title: Text('Shop By Categories'),
            leading: Icon(
              Icons.category,
              color: Colors.black,
            ),
            horizontalTitleGap: 0,
            onTap: () {
              Navigator.pushNamed(context, MainScreen.id,
                  arguments: ScreenArguments(index: 1));
            },
          ),
        ),
        ListTile(
          title: Text(
            'Help',
          ),
          leading: SizedBox(),
          horizontalTitleGap: 0,
        ),
        ListTile(
          title: Text('Feedback'),
          leading: SizedBox(),
          horizontalTitleGap: 0,
        ),
        ListTile(
          title: Text('Social Media'),
          leading: SizedBox(),
          horizontalTitleGap: 0,
        ),
      ],
    ));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/widgets/loginBottomSheet.dart';
import 'package:go_green/backend/models/userdata.dart';
import 'package:go_green/UI/screens/main_screen.dart';
import 'package:go_green/UI/screens/orders_screen.dart';
import 'package:go_green/UI/screens/profile_screen.dart';
import 'package:go_green/backend/utilities/urlLauncher.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import 'helpScreen.dart';
import 'login_screen.dart';

class NavDrawer extends StatelessWidget {
  final _currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
            body: ListView(shrinkWrap: true, children: [
              _currentUser != null
                  ? DrawerHeader(currentUser: true)
                  : DrawerHeader(currentUser: false),
              DrawerTile(
                  title: 'My Profile',
                  iconData: Icons.account_circle_sharp,
                  route: _currentUser != null
                      ? () {
                          Navigator.popAndPushNamed(context, ProfileScreen.id);
                        }
                      : () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return LoginBottomSheet();
                              });
                        }),
              DrawerTile(
                  title: 'My Orders',
                  iconData: Icons.all_inbox_outlined,
                  route: _currentUser != null
                      ? () {
                          Navigator.popAndPushNamed(context, OrderScreen.id);
                        }
                      : () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return LoginBottomSheet();
                              });
                        }),
              DrawerTile(
                  title: 'Shop By Categories',
                  iconData: Icons.category_outlined,
                  route: () {
                    Navigator.popAndPushNamed(context, MainScreen.id,
                        arguments: ScreenArguments(index: 1));
                  }),
              ListTile(
                  title: Text('Help'),
                  leading: SizedBox(),
                  horizontalTitleGap: 0,
                  onTap: () {
                    Navigator.popAndPushNamed(context, HelpScreen.id);
                  }),
              ListTile(
                  title: Text('Feedback'),
                  leading: SizedBox(),
                  horizontalTitleGap: 0,
                  onTap: () {
                    openUrl('mailto:thesupport@ginkgos.online');
                  })
            ]),
            bottomNavigationBar: Container(
                margin: EdgeInsets.all(10),
                height: 70,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Follow us on', style: TextStyle(fontSize: 16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: SvgPicture.asset('images/FBlogo.svg'),
                              onPressed: () {
                                openUrl(
                                    'https://www.facebook.com/GinkgoNurseries');
                              }),
                          IconButton(
                              icon: SvgPicture.asset('images/InstaLogo.svg'),
                              onPressed: () {
                                openUrl(
                                    'https://www.instagram.com/theginkgos/');
                              }),
                          IconButton(
                              icon: SvgPicture.asset('images/Twitter.svg'),
                              onPressed: () {
                                openUrl('https://twitter.com/Ginkgo47700881');
                              }),
                        ],
                      )
                    ]))));
  }
}

class DrawerHeader extends StatelessWidget {
  final bool currentUser;

  const DrawerHeader({required this.currentUser});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.popAndPushNamed(
            context, currentUser ? ProfileScreen.id : LoginScreen.id);
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: kDrawerColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          padding: EdgeInsets.all(10),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentUser
                        ? Text('Welcome', style: TextStyle(fontSize: 22))
                        : Text(
                            'Log In | Sign Up',
                            style: TextStyle(fontSize: 16),
                          ),
                    Text(
                        currentUser
                            ? Provider.of<Userdata>(context, listen: false).name
                            : '',
                        style: kUserName),
                  ],
                ),
                CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text(
                      Provider.of<Userdata>(context, listen: false).name[0],
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    radius: MediaQuery.of(context).size.height * 0.04),
              ])),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    this.title,
    this.iconData,
    required this.route,
    this.arguments,
  }) : super(key: key);
  final title;
  final iconData;
  final Function route;
  final arguments;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey[200]!,
            child: Icon(iconData, color: kDrawerColor)),
        horizontalTitleGap: 0,
        onTap: () {
          route();
        },
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/loadingBeforeCartScreen.dart';
import 'package:go_green/UI/screens/wishListScreen.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';
import 'package:go_green/UI/widgets/loginBottomSheet.dart';
import 'package:go_green/UI/widgets/searchButtonWidget.dart';
import 'package:go_green/backend/utilities/getLocation.dart';
import '../../main.dart';
import 'drawerScreen.dart';
import 'category_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  static String id = 'Main_Screen';
  final temp;

  const MainScreen({Key? key, this.temp}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var arg;

  DateTime? currentBackPressTime;

  List<Widget> _bottomDrawerOptions = [];

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      CustomSnackWidgets.buildErrorSnackBar(context, 'Press Again');
      return Future.value(false);
    }
    return Future.value(true);
  }

  void _onClickCart() {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushNamed(context, CartLoadingScreen.id);
    } else {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return LoginBottomSheet();
          });
    }
  }

  void getLocation() async {
    Position position = await determinePosition(context);
    var result = await checkAvailability(position.latitude, position.longitude);
    if (result) {
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('images/comingSoon.svg',
                          width: MediaQuery.of(context).size.width * 0.7),
                      SizedBox(height: 20),
                      Text('Coming Soon to your Location',
                          style: TextStyle(fontSize: 18))
                    ]),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'))
                ]);
          });
    }
  }

  @override
  void initState() {
    _bottomDrawerOptions = <Widget>[
      HomeScreen(),
      CategoryScreen(),
      WishListScreen(),
    ];

    super.initState();

    ///To access buildContext in initState we use future
    Future.delayed(Duration.zero, () {
      setState(() {
        arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      });
      arg != null ? _selectedIndex = arg.index : _selectedIndex = 0;
    });
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
          title: Text('Ginkgos'),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    child: Icon(Icons.shopping_cart, size: 26.0),
                    onTap: () {
                      _onClickCart();
                    }))
          ],
          bottom: PreferredSize(
              child: SearchButtonWidget(),
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.056))),
      body: WillPopScope(
          onWillPop: onWillPop,
          child: Center(child: _bottomDrawerOptions[_selectedIndex])),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.green[500],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

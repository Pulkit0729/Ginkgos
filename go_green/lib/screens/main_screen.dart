import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/screens/wishlist_screen.dart';
import 'package:go_green/widgets/searchButtonWidget.dart';
import 'drawerScreen.dart';
import 'category_screen.dart';
import 'home_screen.dart';
import 'cart_screen.dart';

class ScreenArguments {
  final int index;
  ScreenArguments(this.index);
}

class MainScreen extends StatefulWidget {
  static String id = 'Main_Screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;
  var arg;
  List<Widget> _bottomDrawerOptions = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    WishlistScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    ///To access buildcontext in initstate we use future
    Future.delayed(Duration.zero, () {
      setState(() {
        arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      });
      _selectedIndex = arg.index;
    });
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
                  onTap: () {
                    Navigator.pushNamed(context, CartScreen.id);
                  },
                  child: Icon(Icons.shopping_cart, size: 26.0),
                )),
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(45), child: SearchButtonWidget())),
      body: Center(
        child: _bottomDrawerOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        onTap: _onItemTapped,
      ),
    );
  }
}

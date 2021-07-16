import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/emptyWishlist.dart';
import 'package:go_green/UI/widgets/searchButtonWidget.dart';
import '../../main.dart';
import 'drawerScreen.dart';
import 'category_screen.dart';
import 'home_screen.dart';
import 'cart_screen.dart';

class MainScreen extends StatefulWidget {
  static String id = 'Main_Screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var arg;
  List<Widget> _bottomDrawerOptions = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    EmptyWishlist(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    ///To access buildContext in initState we use future
    Future.delayed(Duration.zero, () {
      setState(() {
        arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      });
      if (arg != null) {
        _selectedIndex = arg.index;
      } else {
        _selectedIndex = 0;
      }
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
                    child: Icon(Icons.shopping_cart, size: 26.0),
                    onTap: () {
                      Navigator.pushNamed(context, CartScreen.id);
                    }))
          ],
          bottom: PreferredSize(
              child: SearchButtonWidget(),
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.056))),
      body: Center(child: _bottomDrawerOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green[600],
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

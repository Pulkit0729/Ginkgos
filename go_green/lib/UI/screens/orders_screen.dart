import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/main_screen.dart';
import 'package:go_green/UI/screens/emptyScreen.dart';
import 'package:go_green/UI/widgets/orderTile.dart';
import 'package:go_green/backend/models/orderList.dart';
import 'package:go_green/backend/models/orderObject.dart';

class OrderScreen extends StatefulWidget {
  static String id = 'orderScreen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool _isLoading = true;
  late bool _exist;
  late List<OrderItem> _itemList;

  void _temporary() async {
    Map<String, dynamic>? list = await getOrderIds();
    print(list);
    if (list!['Null'] != 'Null') {
      _itemList = await getListOfItems(list.values.toList());
      setState(() {
        _exist = true;
        _isLoading = false;
      });
    } else {
      setState(() {
        _exist = false;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _temporary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldGrey,
        appBar: AppBar(title: Text('Orders')),
        body: _isLoading
            ? SpinKitCircle(color: Colors.blue)
            : _exist
                ? ListView.builder(
                    itemCount: _itemList.length,
                    itemBuilder: (context, int index) {
                      return OrderTile(orderItem: _itemList[index]);
                    })
                : EmptyScreen(
                    text: 'You have not placed any orders yet!.',
                    function: () {
                      Navigator.popAndPushNamed(context, MainScreen.id);
                    },
                    image: 'images/emptyWishlist.svg',
                  ));
  }
}

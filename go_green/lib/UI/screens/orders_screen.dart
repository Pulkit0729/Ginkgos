import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/emptyScreen.dart';
import 'package:go_green/UI/screens/main_screen.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/UI/widgets/orderTile.dart';
import 'package:go_green/backend/models/orderList.dart';
import 'package:go_green/main.dart';

class OrderScreen extends StatelessWidget {
  static String id = 'orderScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldGrey,
        appBar: AppBar(title: Text('Orders')),
        body: FutureBuilder(
          future: getOrderIds(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data['Null'] != 'Null') {
                return FutureBuilder(
                  future: getListOfItems(snapshot.data.values.toList()),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot1) {
                    if (snapshot1.connectionState == ConnectionState.done) {
                      if (snapshot1.hasData) {
                        return ListView.builder(
                            itemCount: snapshot1.data.length,
                            itemBuilder: (context, int index) {
                              return OrderTile(
                                  orderObject: snapshot1.data[index]
                                      ['orderObject'],
                                  status: snapshot1.data[index]['status'],
                                  orderItem: snapshot1.data[index]
                                      ['orderItem']);
                            });
                      } else {
                        return EmptyScreen(
                          text: 'You have not placed any orders yet!.',
                          function: () {
                            Navigator.popAndPushNamed(context, MainScreen.id,
                                arguments: ScreenArguments(index: 1));
                          },
                          image: 'images/svg/emptyWishlist.svg',
                        );
                      }
                    } else {
                      return CustomLoader();
                    }
                  },
                );
              } else {
                return EmptyScreen(
                  text: 'You have not placed any orders yet!.',
                  function: () {
                    Navigator.popAndPushNamed(context, MainScreen.id,
                        arguments: ScreenArguments(index: 1));
                  },
                  image: 'images/svg/emptyWishlist.svg',
                );
              }
            } else {
              return CustomLoader();
            }
          },
        ));
  }
}

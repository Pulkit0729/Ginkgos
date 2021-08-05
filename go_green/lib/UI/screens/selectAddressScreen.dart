import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/addAddress_screen.dart';
import 'package:go_green/UI/screens/payment_screen.dart';
import 'package:go_green/UI/widgets/appBar2.dart';
import 'package:go_green/UI/widgets/cartScreen/cartFooter.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/UI/widgets/selectAddressWidget.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:go_green/backend/models/cartCondition.dart';
import 'package:go_green/backend/provider/serverRequests/getAddress.dart';

import '../../main.dart';

enum selected { obj1, obj2, obj3, none }

class SelectAddressScreen extends StatefulWidget {
  static String id = 'selectAddressScreen';
  final totalAmount;
  final list;
  final quantity;
  final CartConditions cartConditions;
  final sellerId;
  final coupon;
  const SelectAddressScreen(
      {this.totalAmount,
      this.list,
      this.quantity,
      this.coupon,
      this.sellerId,
      required this.cartConditions});

  @override
  _SelectAddressScreenState createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  late selected _selected;
  late AddressObject _obj1;
  late AddressObject _obj2;
  late AddressObject _obj3;
  int _noOfAddress = 0;
  late int _index;

  bool _isLoading = true;

  void _getAddress() async {
    _obj1 = await getAddress('1', context);
    _obj2 = await getAddress('2', context);
    _obj3 = await getAddress('3', context);

    if (_obj1.name == '') {
      _index = 1;
    } else {
      if (_obj2.name == '') {
        _index = 2;
      } else {
        if (_obj3.name == '') {
          _index = 3;
        } else {
          _index = 4;
        }
      }
    }
    if (_obj1.name != '') {
      _noOfAddress = _noOfAddress + 1;
    }
    if (_obj2.name != '') {
      _noOfAddress = _noOfAddress + 1;
    }
    if (_obj3.name != '') {
      _noOfAddress = _noOfAddress + 1;
    }
    if (_noOfAddress == 0) {
      Navigator.of(context).push(PageRouteBuilder(
        settings: RouteSettings(arguments: ScreenArguments(index: 1)),
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddAddressScreen(callback: initState),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ));
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _onClickAdd() {
    if (_index == 4) {
      CustomSnackWidgets.buildErrorSnackBar(
          context, "Maximum No of Address Reached");
    } else {
      Navigator.pushNamed(context, AddAddressScreen.id,
          arguments: ScreenArguments(index: _index));
    }
  }

  void _onProceed() {
    if (_selected == selected.none) {
      CustomSnackWidgets.buildErrorSnackBar(context, 'Select an Address');
    } else {
      Navigator.of(context).push(noAnimationRoute(PaymentScreen(
          cartConditions: widget.cartConditions,
          list: widget.list,
          coupon: widget.coupon,
          quantity: widget.quantity,
          sellerId: widget.sellerId,
          addressObj: _selected == selected.obj1
              ? _obj1
              : _selected == selected.obj2
                  ? _obj2
                  : _obj3)));
    }
  }

  @override
  void initState() {
    _getAddress();
    _selected = selected.none;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldGrey,
        appBar: AppBar2('Select Address', 1),
        body: _isLoading
            ? CustomLoader()
            : SafeArea(
                child: ListView(children: [
                SizedBox(height: 7),
                ListTile(
                    tileColor: Colors.white,
                    leading: Icon(Icons.add, color: Colors.pink),
                    title: Text('Add Address'),
                    shape: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                    onTap: () {
                      _onClickAdd();
                    }),
                SelectAddressWidget(
                    address: _obj1,
                    line: '1',
                    radioWidget: Radio(
                        value: selected.obj1,
                        groupValue: _selected,
                        onChanged: (selected? value) {
                          setState(() {
                            _selected = value!;
                          });
                        })),
                SelectAddressWidget(
                    address: _obj2,
                    line: '2',
                    radioWidget: Radio(
                        value: selected.obj2,
                        groupValue: _selected,
                        onChanged: (selected? value) {
                          setState(() {
                            _selected = value!;
                          });
                        })),
                SelectAddressWidget(
                    address: _obj3,
                    line: '3',
                    radioWidget: Radio(
                        value: selected.obj3,
                        groupValue: _selected,
                        onChanged: (selected? value) {
                          setState(() {
                            _selected = value!;
                          });
                        })),
                NewContainer(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Text(
                          'Total Price(${widget.quantity.fold(0, (p, c) => p + c).toInt().toString()} items)',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      Text('₹${widget.totalAmount.toString()}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700))
                    ]))
              ])),
        bottomNavigationBar: CartFooter(text: 'Proceed', function: _onProceed));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:go_green/backend/provider/serverRequests/getAddress.dart';
import 'package:go_green/main.dart';
import 'package:go_green/UI/screens/addAddress_screen.dart';
import 'package:go_green/UI/widgets/addressTile.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';

class AddressBookScreen extends StatefulWidget {
  static String id = 'addressBook';
  @override
  _AddressBookScreenState createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  late AddressObject _obj1;
  late AddressObject _obj2;
  late AddressObject _obj3;
  late int _noOfAddress;
  late int _index;

  bool _isLoading = true;

  void _getAddress() async {
    _obj1 = await getAddress('1');
    _obj2 = await getAddress('2');
    _obj3 = await getAddress('3');

    if (_obj1.name == '') {
      _noOfAddress = 0;
      _index = 1;
    } else {
      if (_obj2.name == '') {
        _noOfAddress = 1;
        _index = 2;
      } else {
        if (_obj3.name == '') {
          _noOfAddress = 2;
          _index = 3;
        } else {
          _noOfAddress = 3;
        }
      }
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

  @override
  void initState() {
    _getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
      ),
      body: _isLoading
          ? SpinKitHourGlass(
              color: Colors.blue,
            )
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.add, color: Colors.pink),
                    title: Text('Add Address'),
                    shape: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                    onTap: () {
                      _onClickAdd();
                    },
                  ),
                  Container(
                    height: 40,
                    color: Colors.grey[200],
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '$_noOfAddress saved Address',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      AddressWidget(line: '1', object: _obj1),
                      AddressWidget(line: '2', object: _obj2),
                      AddressWidget(line: '3', object: _obj3),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:go_green/backend/provider/serverRequests/getAddress.dart';

import 'customLoadingBar.dart';
import 'customSnackBar.dart';

class SelectAddressWidget extends StatelessWidget {
  const SelectAddressWidget(
      {required this.address, this.line, this.radioWidget});
  final AddressObject address;
  final line;
  final radioWidget;
  void handleClick(String value, BuildContext context) async {
    switch (value) {
      case 'Remove':
        LoadingBar.createLoading(context);
        bool _cond = await deleteAddress(line.toString(), context);
        if (_cond) {
          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
          CustomSnackWidgets.buildErrorSnackBar(context, 'Error');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return address.name == ''
        ? Container()
        : Container(
            margin: EdgeInsets.only(top: 7),
            child: ListTile(
              tileColor: Colors.white,
              horizontalTitleGap: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(address.type,
                      style: TextStyle(color: Colors.green, height: 1.5)),
                  Text(address.name,
                      style: TextStyle(
                          color: Colors.grey[700], height: 1.3, fontSize: 14)),
                  Text(address.address == null ? '' : address.address,
                      style: TextStyle(
                          color: Colors.grey[700], height: 1.3, fontSize: 14)),
                  Text(address.locality == null ? '' : address.locality,
                      style: TextStyle(
                          color: Colors.grey[700], height: 1.3, fontSize: 14)),
                  Text(address.city + '-' + address.pincode,
                      style: TextStyle(
                          color: Colors.grey[700], height: 1.3, fontSize: 14)),
                  Text(address.state,
                      style: TextStyle(
                          color: Colors.grey[700], height: 1.3, fontSize: 14)),
                  Text('Mobile: ${address.phone}',
                      style: TextStyle(
                          color: Colors.grey[700], height: 1.3, fontSize: 14))
                ],
              ),
              leading: radioWidget,
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  handleClick(value, context);
                },
                itemBuilder: (BuildContext context) {
                  return {'Remove'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ),
          );
  }
}

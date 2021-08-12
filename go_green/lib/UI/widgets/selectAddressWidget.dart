import 'package:flutter/material.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:go_green/backend/provider/serverRequests/getAddress.dart';

import 'customLoadingBar.dart';
import 'customSnackBar.dart';

class SelectAddressWidget extends StatefulWidget {
  const SelectAddressWidget(
      {required this.address, this.line, this.radioWidget});
  final AddressObject address;
  final line;
  final radioWidget;

  @override
  _SelectAddressWidgetState createState() => _SelectAddressWidgetState();
}

class _SelectAddressWidgetState extends State<SelectAddressWidget> {
  void handleClick(String value, BuildContext context) async {
    switch (value) {
      case 'Remove':
        LoadingBar.createLoading(context);
        bool _cond = await deleteAddress(widget.line.toString(), context);
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
    return widget.address.name == ''
        ? Container()
        : Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 7),
            padding: EdgeInsets.symmetric(vertical: 7),
            child: Container(
              child: Row(
                children: [
                  Expanded(flex: 1, child: widget.radioWidget),
                  Expanded(
                      flex: 4,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.address.type,
                                style: TextStyle(
                                    color: Colors.green, height: 1.5)),
                            Text(widget.address.name,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    height: 1.3,
                                    fontSize: 14)),
                            Text(
                                widget.address.address == null
                                    ? ''
                                    : widget.address.address,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    height: 1.3,
                                    fontSize: 14)),
                            Text(
                                widget.address.locality == null
                                    ? ''
                                    : widget.address.locality,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    height: 1.3,
                                    fontSize: 14)),
                            Text(
                                widget.address.city +
                                    '-' +
                                    widget.address.pincode,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    height: 1.3,
                                    fontSize: 14)),
                            Text(widget.address.state,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    height: 1.3,
                                    fontSize: 14)),
                            Text('Mobile: ${widget.address.phone}',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    height: 1.3,
                                    fontSize: 14))
                          ])),
                  Expanded(
                    flex: 1,
                    child: PopupMenuButton<String>(
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
                  )
                ],
              ),
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:go_green/backend/provider/serverRequests/getAddress.dart';
import 'package:go_green/UI/screens/addressBook.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';

class AddressWidget extends StatelessWidget {
  final AddressObject object;
  final line;

  const AddressWidget({required this.object, this.line});
  void handleClick(String value, BuildContext context) async {
    switch (value) {
      case 'Remove':
        LoadingBar.createLoading(context);
        bool _cond = await deleteAddress(line);
        if (_cond) {
          Navigator.pop(context);
          Navigator.popAndPushNamed(context, AddressBookScreen.id);
        } else {
          Navigator.pop(context);
          CustomSnackWidgets.buildErrorSnackBar(context, 'Error');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return object.name == ''
        ? Container()
        : Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Icon(object.type == 'Home'
                        ? Icons.home_outlined
                        : Icons.work_outline)),
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        object.type,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        object.name,
                        style: TextStyle(color: Colors.grey[700], height: 1.5),
                      ),
                      // Text(
                      //   _obj.address,
                      //   style: TextStyle(color: Colors.grey[700], height: 1.5),
                      // ),
                      Text(
                        object.city + '-' + object.pincode,
                        style: TextStyle(color: Colors.grey[700], height: 1.5),
                      ),
                      Text(
                        object.state,
                        style: TextStyle(color: Colors.grey[700], height: 1.5),
                      ),
                      Text(
                        'Mobile: ${object.phone}',
                        style: TextStyle(color: Colors.grey[700], height: 1.5),
                      )
                    ],
                  ),
                ),
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
          );
  }
}

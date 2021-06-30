import 'package:flutter/material.dart';
import 'package:go_green/screens/addAddress_screen.dart';
import 'package:go_green/widgets/addressTile.dart';

class AddressBookScreen extends StatelessWidget {
  static String id = 'addressBook';

  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.add, color: Colors.pink),
              title: Text('Add Address'),
              shape: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              onTap: () {
                Navigator.pushNamed(context, AddAddressScreen.id);
              },
            ),
            ListView(
              shrinkWrap: true,
              children: [
                AddressWidget(
                  name: 'Pulkit Aggarwal',
                  type: 'work',
                  number: '8059345289',
                  pinCode: '123401',
                  state: 'Haryana',
                  city: 'Rewari',
                  address: 'A-38',
                  locality: 'Ansal',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/backend/models/address.dart';

class AddressTile2 extends StatelessWidget {
  const AddressTile2({Key? key, required this.addressObject}) : super(key: key);
  final AddressObject addressObject;
  @override
  Widget build(BuildContext context) {
    print(addressObject.name);
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
            child: Text(
              'Shipping Address',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
          Text(
            addressObject.name,
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
          Text(
            addressObject.address,
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
          Text(
            addressObject.locality,
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
          Text(
            addressObject.city + '-' + addressObject.pincode,
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
          Text(
            addressObject.state,
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
          Text(
            'Mobile: ${addressObject.phone}',
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/widgets/productDescrip/container.dart';

class AddressTile2 extends StatelessWidget {
  const AddressTile2(
      {Key? key,
      this.type,
      this.name,
      this.number,
      this.address,
      this.city,
      this.pinCode,
      this.state,
      this.locality})
      : super(key: key);
  final type;
  final name;
  final number;
  final address;
  final city;
  final pinCode;
  final state;
  final locality;
  @override
  Widget build(BuildContext context) {
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
            name,
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
          Text(
            address,
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
          Text(
            city + '-' + pinCode,
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
          Text(
            state,
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
          Text(
            'Mobile: $number',
            style: TextStyle(color: Colors.grey[700], height: 1.5),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/constants/colorsConstant.dart';
import 'package:go_green/widgets/productDescrip/container.dart';

class SelectAddressWidget extends StatelessWidget {
  const SelectAddressWidget(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(color: Colors.grey[700], height: 1.5),
              ),
              Text(
                type,
                style: TextStyle(color: Colors.green, height: 1.5),
              ),
            ],
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
          Container(
            margin: EdgeInsets.only(top: 7),
            padding: EdgeInsets.all(5),
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Text(
                  'Change or Add Address',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

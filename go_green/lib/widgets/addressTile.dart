import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    Key? key,
    this.type,
    this.name,
    this.number,
    this.address,
    this.city,
    this.pinCode,
    this.state,
    this.locality,
  }) : super(key: key);
  final type;
  final name;
  final number;
  final address;
  final city;
  final pinCode;
  final state;
  final locality;

  void handleClick(String value) {
    switch (value) {
      case 'Edit':
        break;
      case 'Remove':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Icon(
                  type == 'Home' ? Icons.home_outlined : Icons.work_outline)),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 16,
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
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Edit', 'Remove'}.map((String choice) {
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

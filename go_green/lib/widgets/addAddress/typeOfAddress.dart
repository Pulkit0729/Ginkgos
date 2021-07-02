import 'package:flutter/material.dart';
import 'package:go_green/constants/textStyles.dart';
import 'package:go_green/widgets/productDescrip/container.dart';

enum typeOfAddress { home, work, none }

class TypeOfAddress extends StatefulWidget {
  const TypeOfAddress({Key? key}) : super(key: key);

  @override
  _TypeOfAddressState createState() => _TypeOfAddressState();
}

class _TypeOfAddressState extends State<TypeOfAddress> {
  late typeOfAddress _type0fAddress;
  @override
  void initState() {
    _type0fAddress = typeOfAddress.none;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Type of Address*', style: kAddressLabel),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            horizontalTitleGap: 0,
            title: Text('Home', style: kAddressLabel),
            leading: Radio(
                value: typeOfAddress.home,
                groupValue: _type0fAddress,
                onChanged: (typeOfAddress? value) {
                  setState(() {
                    _type0fAddress = value!;
                  });
                }),
            onTap: () {
              setState(() {
                _type0fAddress = typeOfAddress.home;
              });
            },
          ),
          ListTile(
              contentPadding: EdgeInsets.all(0),
              horizontalTitleGap: 0,
              title: Text('Work', style: kAddressLabel),
              leading: Radio(
                  value: typeOfAddress.work,
                  groupValue: _type0fAddress,
                  onChanged: (typeOfAddress? value) {
                    setState(() {
                      _type0fAddress = value!;
                    });
                  }),
              onTap: () {
                setState(() {
                  _type0fAddress = typeOfAddress.work;
                });
              }),
        ],
      ),
    );
  }
}

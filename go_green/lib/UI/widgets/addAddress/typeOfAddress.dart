import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';

enum typeOfAddress { Home, Work, none }

class TypeOfAddress extends StatefulWidget {
  final function;

  const TypeOfAddress({Key? key, this.function}) : super(key: key);
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
                value: typeOfAddress.Home,
                groupValue: _type0fAddress,
                onChanged: (typeOfAddress? value) {
                  widget.function('Home');
                  setState(() {
                    _type0fAddress = value!;
                  });
                }),
            onTap: () {
              widget.function('Home');
              setState(() {
                _type0fAddress = typeOfAddress.Home;
              });
            },
          ),
          ListTile(
              contentPadding: EdgeInsets.all(0),
              horizontalTitleGap: 0,
              title: Text('Work', style: kAddressLabel),
              leading: Radio(
                  value: typeOfAddress.Work,
                  groupValue: _type0fAddress,
                  onChanged: (typeOfAddress? value) {
                    widget.function('Work');
                    setState(() {
                      _type0fAddress = value!;
                    });
                  }),
              onTap: () {
                widget.function('Work');
                setState(() {
                  _type0fAddress = typeOfAddress.Work;
                });
              }),
        ],
      ),
    );
  }
}

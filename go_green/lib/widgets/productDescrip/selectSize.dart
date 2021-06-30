import 'package:flutter/material.dart';
import 'package:go_green/constants/textStyles.dart';

import 'container.dart';

class SelectSizeWidget extends StatelessWidget {
  const SelectSizeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Select Size', style: ksubHeading),
          SizedBox(height: 5),
          Text(
            'Height: 5 inch',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              ElevatedButton(
                  child: Text('S ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black)),
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white))),
              ElevatedButton(
                  child: Text('M ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black)),
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white))),
              ElevatedButton(
                  child: Text('L ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black)),
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      backgroundColor: MaterialStateProperty.all(Colors.white)))
            ],
          )
        ],
      ),
    );
  }
}

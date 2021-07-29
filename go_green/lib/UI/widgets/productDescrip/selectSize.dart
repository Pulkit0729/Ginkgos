import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';

import 'container.dart';

class SizeWidget extends StatelessWidget {
  final String height;
  final String diameter;

  const SizeWidget({Key? key, required this.height, required this.diameter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Size', style: kSubHeading),
          SizedBox(height: 5),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Height'),
            Text(height, style: TextStyle(color: Colors.grey, fontSize: 14))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Diameter'),
            Text(diameter, style: TextStyle(color: Colors.grey, fontSize: 14))
          ]),
        ],
      ),
    );
  }
}

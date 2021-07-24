import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';

import 'container.dart';

class SizeWidget extends StatelessWidget {
  final size;

  const SizeWidget({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Size', style: kSubHeading),
          SizedBox(height: 5),
          Text(
            size,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

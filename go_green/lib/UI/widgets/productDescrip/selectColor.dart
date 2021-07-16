import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';

import 'container.dart';

class SelectColor extends StatelessWidget {
  const SelectColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Select Color', style: kSubHeading),
          Row(
            children: [
              ElevatedButton(
                  child: Container(),
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      backgroundColor: MaterialStateProperty.all(Colors.blue))),
              ElevatedButton(
                  child: Container(),
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      backgroundColor: MaterialStateProperty.all(Colors.red))),
              ElevatedButton(
                  child: Container(),
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)))
            ],
          )
        ],
      ),
    );
  }
}

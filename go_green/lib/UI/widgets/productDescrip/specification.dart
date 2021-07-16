import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/widgets/productDescrip/specIconWidget.dart';

import 'container.dart';

class Specification extends StatefulWidget {
  const Specification({
    Key? key,
  }) : super(key: key);

  @override
  _SpecificationState createState() => _SpecificationState();
}

class _SpecificationState extends State<Specification> {
  final List<String> strings = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
    ' ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
    'dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
  ];
  var isPressed = 0;
  late var spec;
  void press(index) {
    isPressed = index;
    spec = strings[index];
  }

  @override
  void initState() {
    spec = strings[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Specifications',
            style: kSubHeading,
          ),
          Row(children: [
            SpecIconWidget(
                iconData: Icons.wb_sunny,
                opacity: isPressed == 0 ? 1 : 0,
                color: isPressed == 0 ? Colors.orangeAccent : Colors.white,
                function: () {
                  setState(() {
                    press(0);
                  });
                }),
            SpecIconWidget(
                iconData: FontAwesomeIcons.tint,
                opacity: isPressed == 1 ? 1 : 0,
                color: isPressed == 1 ? Colors.lightBlueAccent : Colors.white,
                function: () {
                  setState(() {
                    press(1);
                  });
                }),
            SpecIconWidget(
                iconData: FontAwesomeIcons.thermometerThreeQuarters,
                opacity: isPressed == 2 ? 1 : 0,
                color: isPressed == 2 ? Colors.redAccent : Colors.white,
                function: () {
                  setState(() {
                    press(2);
                  });
                })
          ]),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(10)),
            child: Text(spec),
          )
        ],
      ),
    );
  }
}

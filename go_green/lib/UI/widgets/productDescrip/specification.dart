import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_green/UI/constants/textStyles.dart';

import 'container.dart';

class Specification extends StatelessWidget {
  const Specification({this.light, this.water, this.location});
  final String? light;
  final String? water;
  final String? location;

  String _nullCheck(String? value) => value == null ? '' : value;

  @override
  Widget build(BuildContext context) {
    return NewContainer(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        'Specifications',
        style: kSubHeading,
      ),
      SizedBox(height: 20),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SpecIconWidget(
              iconData: Icons.wb_sunny,
              text: _nullCheck(light),
              title: 'Light',
              image: 'images/sun.png',
            ),
            SpecIconWidget(
              iconData: FontAwesomeIcons.tint,
              text: _nullCheck(water),
              title: 'Water',
              image: 'images/water.png',
            ),
            SpecIconWidget(
              iconData: FontAwesomeIcons.thermometerThreeQuarters,
              text: _nullCheck(location),
              title: 'Ideal Location',
              image: 'images/location.jpg',
            )
          ]))
    ]));
  }
}

class SpecIconWidget extends StatelessWidget {
  const SpecIconWidget({this.iconData, this.text, this.title, this.image});
  final iconData;
  final image;
  final title;
  final text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!)),
          child: Image.asset(image),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(text.toString())
      ],
    );
  }
}

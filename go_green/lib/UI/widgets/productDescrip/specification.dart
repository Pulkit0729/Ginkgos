import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';

import 'container.dart';

class Specification extends StatelessWidget {
  const Specification({this.light, this.water, this.location, this.withPot});
  final String? light;
  final String? water;
  final String? withPot;
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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpecIconWidget(
                        text: _nullCheck(light),
                        title: 'Light',
                        image: 'images/sun.png',
                      ),
                      SizedBox(height: 10),
                      SpecIconWidget(
                        text: _nullCheck(water),
                        title: 'Water',
                        image: 'images/water.png',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpecIconWidget(
                        text: _nullCheck(location),
                        title: 'Ideal Location',
                        image: 'images/location.jpg',
                      ),
                      SizedBox(height: 10),
                      SpecIconWidget(
                        text: _nullCheck(withPot) == '0' ? 'No' : 'Yes',
                        title: 'With Pot',
                        image: 'images/pot.jpg',
                      ),
                    ],
                  ),
                )
              ]))
    ]));
  }
}

class SpecIconWidget extends StatelessWidget {
  const SpecIconWidget({this.text, this.title, this.image});
  final image;
  final title;
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
                softWrap: false,
              ),
              Text(text.toString())
            ],
          ),
        ),
      ],
    );
  }
}

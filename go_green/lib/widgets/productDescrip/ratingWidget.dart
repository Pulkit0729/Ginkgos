import 'package:flutter/material.dart';
import 'package:go_green/constants/colorsConstant.dart';
import 'package:go_green/constants/textStyles.dart';
import 'package:go_green/widgets/productDescrip/container.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Ratings & Reviews', style: kSubHeading),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(children: [
                      Text('4.6', style: TextStyle(fontSize: 44)),
                      Text('10 Verified User')
                    ])),
                Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.grey[300]!, width: 2))),
                      child: Column(children: [
                        RatingSliderWidget('5', '500', 70),
                        RatingSliderWidget('4', '5', 10),
                        RatingSliderWidget('3', '5', 40),
                        RatingSliderWidget('2', '5', 50),
                        RatingSliderWidget('1', '5', 10),
                      ]),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RatingSliderWidget extends StatelessWidget {
  const RatingSliderWidget(this.star, this.noOfRates, this.width);
  final star;
  final width;
  final noOfRates;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text('$star⭐', style: TextStyle(fontSize: 12)),
          Expanded(
              flex: width, child: Container(height: 4, color: kPrimaryColor)),
          Expanded(
              flex: (100 - width).toInt(),
              child: Container(height: 4, color: Colors.grey[200])),
          Container(
            margin: EdgeInsets.only(left: 5),
            width: 35,
            child: Text(
              noOfRates,
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

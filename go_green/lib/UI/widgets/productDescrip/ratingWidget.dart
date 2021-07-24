import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({required this.ratings});
  final List<dynamic> ratings;

  String average() {
    num totalStars = 0;
    for (var i = 0; i < ratings.length; i++) {
      totalStars = totalStars + ratings[i] * (i + 1);
    }
    return (totalStars / ratings.fold(0, (p, c) => p + c))
        .truncate()
        .toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final num sum = ratings.fold(0, (p, c) => p + c);
    return sum != 0
        ? NewContainer(
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
                            Text(average(), style: TextStyle(fontSize: 44)),
                            Text('$sum Verified User')
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
                              RatingSliderWidget('5', ratings[4].toString(),
                                  ratings[4] * 100.0 / sum),
                              RatingSliderWidget('4', ratings[3].toString(),
                                  ratings[3] * 100.0 / sum),
                              RatingSliderWidget('3', ratings[2].toString(),
                                  ratings[2] * 100.0 / sum),
                              RatingSliderWidget('2', ratings[1].toString(),
                                  ratings[1] * 100.0 / sum),
                              RatingSliderWidget('1', ratings[0].toString(),
                                  ratings[0] * 100.0 / sum),
                            ]),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        : Container();
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
              flex: width.toInt(),
              child: Container(height: 4, color: kPrimaryColor)),
          Expanded(
              flex: (100.00 - width).toInt(),
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

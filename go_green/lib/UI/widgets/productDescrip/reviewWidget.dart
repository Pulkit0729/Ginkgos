import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Customer Reviews', style: kSubHeading),
          SizedBox(height: 8),
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ReviewTile();
              }),
          InkWell(
            child: Text(
              'View All',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.green,
                margin: EdgeInsets.only(top: 3, right: 3, left: 3),
                child: Text('5*',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12))),
          ),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Nice Plant',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '),
                SizedBox(height: 10),
                Text(
                  'Pulkit Aggarwal | 21 June 2021',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

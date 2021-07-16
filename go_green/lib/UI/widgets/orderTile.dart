import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/orderDetailsScreen.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OrderDetailsScreen.id);
      },
      child: Container(
          padding: EdgeInsets.only(top: 20, right: 10, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        'images/product.jpeg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Pending Approval',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Croton indoor plant',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 10),
                        Text('⭐⭐⭐⭐⭐'),
                        SizedBox(height: 10),
                        Text(
                          'Write a review',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ],
          )),
    );
  }
}

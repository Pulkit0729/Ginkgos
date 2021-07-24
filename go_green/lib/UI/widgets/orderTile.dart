import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_green/UI/screens/orderDetailsScreen.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/backend/models/orderObject.dart';
import 'package:go_green/backend/provider/firebase/addRating.dart';
import 'package:go_green/main.dart';

class OrderTile extends StatefulWidget {
  final OrderItem orderItem;
  const OrderTile({required this.orderItem});

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  double rating = 0;

  @override
  void initState() {
    rating = double.parse(widget.orderItem.rating);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, OrderDetailsScreen.id,
              arguments: ScreenArguments(orderId: widget.orderItem.orderId));
        },
        child: Container(
            padding: EdgeInsets.only(top: 20, right: 10, bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(widget.orderItem.image,
                              fit: BoxFit.fitHeight)))),
              Expanded(
                  flex: 4,
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(widget.orderItem.status,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700)),
                            SizedBox(height: 10),
                            Text(widget.orderItem.name,
                                style: TextStyle(color: Colors.grey[600])),
                            SizedBox(height: 10),
                            RatingBarIndicator(
                                rating: rating,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                        onTap: () async {
                                          LoadingBar.createLoading(context);
                                          await onRate(
                                              rating: index + 1,
                                              orderId: widget.orderItem.orderId,
                                              itemId: widget.orderItem.itemId);
                                          setState(() {
                                            rating = index + 1;
                                            Navigator.pop(context);
                                            Fluttertoast.showToast(
                                                msg: "Thank you for rating",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          });
                                        },
                                        child: Icon(Icons.star,
                                            color: Colors.amber)),
                                itemSize: 25),
                            SizedBox(height: 10)
                          ]))),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Icon(Icons.arrow_forward_ios, size: 15))
            ])));
  }
}

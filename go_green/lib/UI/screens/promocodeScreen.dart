import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/backend/models/coupon.dart';

class PromoCodeScreen extends StatelessWidget {
  static String id = 'PromoCodeScreen';

  final totalAmount;
  final callback;

  const PromoCodeScreen({this.totalAmount, this.callback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coupon'),
        ),
        backgroundColor: kScaffoldGrey,
        body: SafeArea(
            child: FutureBuilder(
                future: coupons(),
                initialData: [],
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CouponTile(
                            coupon: snapshot.data[index],
                            totalAmount: totalAmount,
                            callback: callback,
                          );
                        });
                  } else {
                    return SpinKitCircle(color: kLoadingColor);
                  }
                })));
  }
}

class CouponTile extends StatelessWidget {
  final Coupon coupon;
  final totalAmount;
  final callback;

  const CouponTile({required this.coupon, this.totalAmount, this.callback});
  @override
  Widget build(BuildContext context) {
    print(totalAmount);
    return NewContainer(
        child: Row(children: [
      Expanded(
          flex: 5,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: Text(coupon.name, style: TextStyle(fontSize: 18)),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                border: Border.all(
                    color: kSecondaryColor!, style: BorderStyle.solid),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            SizedBox(height: 10),
            Text(
                'Get ${coupon.percentage}% OFF uo to ${coupon.maximumDiscount}'),
            SizedBox(height: 5),
            Text(
              'Valid on orders with items worth ${coupon.minimumAmount} or more',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            )
          ])),
      SizedBox(width: 10),
      Expanded(
          flex: 1,
          child: GestureDetector(
              onTap: () {
                if (double.parse(totalAmount) >=
                    double.parse(coupon.minimumAmount)) {
                  var tempDisc = double.parse(coupon.percentage) *
                      double.parse(totalAmount) /
                      100;
                  var discount;
                  tempDisc > double.parse(coupon.maximumDiscount)
                      ? discount = double.parse(coupon.maximumDiscount)
                      : discount = tempDisc;
                  callback(discount);
                  Navigator.pop(context);
                } else {
                  CustomSnackWidgets.buildErrorSnackBar(
                      context, 'Cannot Apply Coupon Code');
                }
              },
              child: Text('Apply', style: TextStyle(color: kSecondaryColor))))
    ]));
  }
}

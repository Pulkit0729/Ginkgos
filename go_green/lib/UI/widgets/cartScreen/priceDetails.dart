import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/backend/models/priceDetailsObject.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({required this.priceDetailsObject});
  final PriceDetailsObject priceDetailsObject;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: NewContainer(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]!))),
                  child: Text('Price Details', style: kSubHeading2)),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Total Price(${priceDetailsObject.totalItems} items)',
                              style: kInvoiceStyle),
                          Text('+${priceDetailsObject.totalPrice}',
                              style: kTotalPrice)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount', style: kInvoiceStyle),
                          Text('-${priceDetailsObject.discount}',
                              style: kDiscount)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Coupon Discount', style: kInvoiceStyle),
                          Text('-${priceDetailsObject.couponDiscount}',
                              style: kCouponDiscount)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Charges', style: kInvoiceStyle),
                          Text('+${priceDetailsObject.deliverCharges}',
                              style: kDeliveryCharge)
                        ])
                  ])),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(color: Colors.grey[200]!))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount', style: kTotalAmount),
                        Text('₹${priceDetailsObject.totalAmount}',
                            style: kTotalAmountPrice)
                      ]))
            ])));
  }
}

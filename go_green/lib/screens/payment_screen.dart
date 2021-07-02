import 'package:flutter/material.dart';
import 'package:go_green/constants/colorsConstant.dart';
import 'package:go_green/constants/textStyles.dart';
import 'package:go_green/widgets/cartScreen/cartFooter.dart';
import 'package:go_green/widgets/cartScreen/cartStageWidget.dart';
import 'package:go_green/widgets/cartScreen/priceDetails.dart';

class PaymentScreen extends StatefulWidget {
  static String id = 'paymentScreen';

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldGrey,
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SafeArea(
          child: ListView(children: [
        CartStage(index: 2),
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 7),
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10, left: 20),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey[200]!))),
                child: Text(
                  'Payment Options',
                  style: kSubHeading,
                ),
              ),
              PaymentTile(
                list: ['Helo', 'Bel'],
                heading: 'Card',
                iconData: Icons.credit_card,
              ),
              PaymentTile(
                list: ['Helo', 'Bel'],
                heading: 'Upi',
                iconData: Icons.payment_outlined,
              ),
            ],
          ),
        ),
        PriceDetails(
          totalAmount: '340',
          totalPrice: '500',
          discount: '200',
          couponDiscount: '0',
          deliveryCharge: '40',
        )
      ])),
      bottomNavigationBar: CartFooter(text: 'Confirm'),
    );
  }
}

class PaymentTile extends StatefulWidget {
  const PaymentTile({
    Key? key,
    this.heading,
    required this.list,
    this.iconData,
  }) : super(key: key);
  final heading;
  final iconData;
  final List<String> list;

  @override
  _PaymentTileState createState() => _PaymentTileState();
}

class _PaymentTileState extends State<PaymentTile> {
  late List<String> list1;

  @override
  void initState() {
    super.initState();
    list1 = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(widget.iconData),
          title: Text(widget.heading),
          trailing: Icon(Icons.arrow_drop_down_sharp),
          horizontalTitleGap: 0,
          onTap: () {
            setState(() {
              list1.isEmpty ? list1.addAll(widget.list) : list1.clear();
              print(list1);
            });
          },
        ),
        Container(
            color: Colors.white,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: list1.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(list1[index]),
                    onTap: () {},
                  );
                }))
      ],
    );
  }
}

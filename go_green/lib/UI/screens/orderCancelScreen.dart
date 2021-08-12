import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/orderCancelConfirmed.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/backend/models/cancelObject.dart';
import 'package:go_green/backend/models/orderObject.dart';
import 'package:go_green/backend/provider/firebase/cancelOrder.dart';

import 'orderDetailsScreen.dart';

enum reasons { mistake, notRequired, delayedDelivery, other, none }

class OrderCancelScreen extends StatefulWidget {
  final OrderObject orderObject;
  const OrderCancelScreen({required this.orderObject});

  @override
  _OrderCancelScreenState createState() => _OrderCancelScreenState();
}

class _OrderCancelScreenState extends State<OrderCancelScreen> {
  late reasons _reason;
  late TextEditingController _comments;
  void _onCancel() async {
    if (_reason == reasons.none) {
      CustomSnackWidgets.buildErrorSnackBar(context, 'Select a reason');
    } else {
      await cancelOrder(
          orderObject: widget.orderObject,
          cancelObject: CancelObject(
              by: 'Customer',
              reason: _reason.toString(),
              comments: _comments.text));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ConfirmedCancel(orderObject: widget.orderObject)),
      );
    }
  }

  @override
  void initState() {
    _comments = TextEditingController();
    _reason = reasons.none;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Reasons'),
        ),
        body: ListView(children: [
          NewContainer(
              child: Column(children: [
            OrderInfoTile(text: 'Order ID', value: widget.orderObject.orderId),
            OrderInfoTile(
                text: 'Order date',
                value: widget.orderObject.orderDate.split(' ')[0]),
            OrderInfoTile(
                text: 'Order Total',
                value: widget.orderObject.priceDetailsObject.totalAmount),
            OrderInfoTile(
                text: 'Mode of Payment',
                value: widget.orderObject.modeOfPayment)
          ])),
          Divider(thickness: 1, height: 1),
          ListTile(
              tileColor: Colors.white,
              title: Text('Select reason for cancelling*')),
          RadioListTile(
              title: Text('Order By Mistake'),
              value: reasons.mistake,
              groupValue: _reason,
              onChanged: (reasons? value) {
                setState(() {
                  _reason = value!;
                });
              }),
          RadioListTile(
              title: Text('Product not required anymore'),
              value: reasons.notRequired,
              groupValue: _reason,
              onChanged: (reasons? value) {
                setState(() {
                  _reason = value!;
                });
              }),
          RadioListTile(
              title: Text('Delivery is taking longer than expected'),
              value: reasons.delayedDelivery,
              groupValue: _reason,
              onChanged: (reasons? value) {
                setState(() {
                  _reason = value!;
                });
              }),
          RadioListTile(
              title: Text('Others'),
              value: reasons.other,
              groupValue: _reason,
              onChanged: (reasons? value) {
                setState(() {
                  _reason = value!;
                });
              }),
          NewContainer(
              child: TextFormField(
                  maxLines: 5,
                  controller: _comments,
                  decoration: InputDecoration(
                      hintText: 'Additional Comments',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)))))
        ]),
        bottomNavigationBar: TextButton(
            child: Text('CANCEL', style: TextStyle(color: Colors.white)),
            onPressed: _onCancel,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red))));
  }
}

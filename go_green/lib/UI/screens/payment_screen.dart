import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/screens/main_screen.dart';
import 'package:go_green/UI/widgets/appBar2.dart';
import 'package:go_green/UI/widgets/cartScreen/cartFooter.dart';
import 'package:go_green/UI/widgets/cartScreen/priceDetails.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';
import 'package:go_green/UI/widgets/orderSuccessful.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:go_green/backend/models/cartCondition.dart';
import 'package:go_green/backend/models/orderObject.dart';
import 'package:go_green/backend/models/priceDetailsObject.dart';
import 'package:go_green/backend/models/userdata.dart';
import 'package:go_green/backend/provider/firebase/placingOrder.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

enum modeOfPayment { online, cod, none }

class PaymentScreen extends StatefulWidget {
  static String id = 'paymentScreen';
  final list;
  final quantity;
  final sellerId;
  final CartConditions cartConditions;
  final AddressObject addressObj;
  final coupon;

  const PaymentScreen(
      {this.list,
      required this.addressObj,
      required this.cartConditions,
      this.quantity,
      this.coupon,
      this.sellerId});
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay _razorpay;

  late modeOfPayment _modeOfPayment;

  void _openCheckout() async {
    var options = {
      'key': await FirebaseFirestore.instance
          .collection('Key')
          .doc('Key')
          .get()
          .then((DocumentSnapshot docSnap) => docSnap['id']),
      'amount': double.parse(PriceDetailsObject.fromList(widget.list,
                  widget.quantity, widget.coupon, widget.cartConditions)
              .totalAmount) *
          100,
      'name': Provider.of<Userdata>(context, listen: false).name.toString(),
      'description': 'Plants And Pots',
      'prefill': {
        'contact':
            Provider.of<Userdata>(context, listen: false).phone.toString(),
        'email': Provider.of<Userdata>(context, listen: false).email.toString()
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
      CustomSnackWidgets.buildErrorSnackBar(context, 'An Error Occurred');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _onPlaceOrder();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error');
    Navigator.pushNamedAndRemoveUntil(context, MainScreen.id, (route) => false);
    showDialog(
        context: context,
        builder: (_) => AlertDialog(title: Text('Payment Cancelled'), actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ]));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('Payment Wallet');
  }

  void _onClickConfirm() {
    if (_modeOfPayment == modeOfPayment.online) {
      _openCheckout();
    } else {
      showDialog(
          context: context,
          builder: (_) =>
              AlertDialog(title: Text('Confirm Your Order'), actions: [
                TextButton(onPressed: _onPlaceOrder, child: Text('Yes')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No'))
              ]),
          barrierDismissible: false);
    }
  }

  void _onPlaceOrder() async {
    String _orderId = DateTime.now().millisecondsSinceEpoch.toString();
    LoadingBar.createLoading(context);

    bool result = await placeOrder(
        OrderObject(
          sellerId: widget.sellerId,
          priceDetailsObject: PriceDetailsObject.fromList(widget.list,
              widget.quantity, widget.coupon, widget.cartConditions),
          addressObject: widget.addressObj,
          orderDate: DateTime.now().toString(),
          userId: FirebaseAuth.instance.currentUser!.uid,
          modeOfPayment: _modeOfPayment == modeOfPayment.cod
              ? 'Cash on Delivery'
              : 'Online',
          orderId: _orderId,
          orderItems: buildOrderItemsInternal(
              qty: widget.quantity, orderId: _orderId, list: widget.list),
          status: 'Pending Approval',
        ),
        context);

    if (result) {
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.id, (route) => false);
      showDialog(
          context: context,
          builder: (_) => OrderSuccessful(),
          barrierDismissible: true);
    } else {
      CustomSnackWidgets.buildErrorSnackBar(context, 'Order was not confirmed');
    }
  }

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _modeOfPayment = modeOfPayment.online;
    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldGrey,
        appBar: AppBar2('Payment', 2),
        body: SafeArea(
            child: ListView(children: [
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
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]!))),
                        child: Text('Payment Options', style: kSubHeading)),
                    ListTile(
                        leading: Radio(
                            value: modeOfPayment.online,
                            groupValue: _modeOfPayment,
                            onChanged: (modeOfPayment? value) {
                              setState(() {
                                _modeOfPayment = value!;
                              });
                            }),
                        title: Text('Upi / Card / Netbanking')),
                    ListTile(
                        leading: Radio(
                            value: modeOfPayment.cod,
                            groupValue: _modeOfPayment,
                            onChanged: (modeOfPayment? value) {
                              setState(() {
                                _modeOfPayment = value!;
                              });
                            }),
                        title: Text('Cash on Delivery'))
                  ])),
          PriceDetails(
              priceDetailsObject: PriceDetailsObject.fromList(widget.list,
                  widget.quantity, widget.coupon, widget.cartConditions))
        ])),
        bottomNavigationBar:
            CartFooter(text: 'Confirm', function: _onClickConfirm));
  }
}

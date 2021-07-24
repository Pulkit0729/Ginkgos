import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/promocodeScreen.dart';
import 'package:go_green/UI/screens/selectAddressScreen.dart';
import 'package:go_green/UI/widgets/appBar2.dart';
import 'package:go_green/UI/widgets/cartScreen/cartFooter.dart';
import 'package:go_green/UI/widgets/cartScreen/priceDetails.dart';
import 'package:go_green/UI/widgets/productCard/productCard(Cart).dart';
import 'package:go_green/backend/models/cartItems.dart';
import 'package:go_green/backend/models/priceDetailsObject.dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/backend/provider/serverRequests/getProductList.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cartScreen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isLoading = true;
  bool _isPromoApplied = false;
  late List<dynamic> _list;

  late List<num> quantity;
  late double coupon;

  void callback(value) {
    print(value);
    setState(() {
      _isPromoApplied = true;
      coupon = value;
    });
  }

  Future<void> function(Map<String, dynamic> list) async {
    var newList = await getProductsFromList(list.values.toString());
    setState(() {
      _list = newList;
      _isLoading = false;
    });
    quantity = List<num>.generate(_list.length, (index) => 1);
  }

  @override
  void initState() {
    function(Provider.of<CartItems>(context, listen: false).list);
    coupon = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SpinKitCircle(color: Colors.blue)
        : Scaffold(
            backgroundColor: kScaffoldGrey,
            appBar: AppBar2('Cart', 0),
            body: SafeArea(
                child: ListView(shrinkWrap: true, children: [
              ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard4(
                        callback: (value) {
                          setState(() {
                            quantity[index] = double.parse(value);
                            _isPromoApplied = false;
                            coupon = 0;
                          });
                        },
                        // sizes: ['1', '2', '3'],
                        product: Product.fromJson(_list[index]));
                  }),
              SizedBox(height: 4),
              ListTile(
                horizontalTitleGap: 0,
                tileColor: Colors.white,
                leading: Icon(Icons.local_offer_outlined),
                title: Text(
                    _isPromoApplied ? 'Promo Applied' : 'Apply Promocodes',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                trailing: _isPromoApplied
                    ? Text('Remove')
                    : Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                onTap: () {
                  _isPromoApplied
                      ? setState(() {
                          _isPromoApplied = false;
                          coupon = 0;
                        })
                      : Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PromoCodeScreen(
                              totalAmount: PriceDetailsObject.fromList(
                                      _list, quantity, coupon)
                                  .totalAmount,
                              callback: callback)));
                },
              ),
              PriceDetails(
                  priceDetailsObject:
                      PriceDetailsObject.fromList(_list, quantity, coupon))
            ])),
            bottomNavigationBar: CartFooter(
                text: 'Place Order',
                function: () {
                  Navigator.of(context)
                      .push(noAnimationRoute(SelectAddressScreen(
                    totalAmount:
                        PriceDetailsObject.fromList(_list, quantity, coupon)
                            .totalAmount,
                    list: _list,
                    quantity: quantity,
                    coupon: coupon,
                  )));
                }));
  }
}

// ['1', '2', '3']

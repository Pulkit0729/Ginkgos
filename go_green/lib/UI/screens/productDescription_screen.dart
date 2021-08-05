import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/widgets/appBar3.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/UI/widgets/productDescrip/description.dart';
import 'package:go_green/UI/widgets/productDescrip/productAvailabilty.dart';
import 'package:go_green/UI/widgets/productDescrip/productFooter.dart';
import 'package:go_green/UI/widgets/productDescrip/productImage.dart';
import 'package:go_green/UI/widgets/productDescrip/productName.dart';
import 'package:go_green/UI/widgets/productDescrip/ratingWidget.dart';
import 'package:go_green/UI/widgets/productDescrip/selectSize.dart';
import 'package:go_green/UI/widgets/productDescrip/specification.dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/backend/provider/serverRequests/completeProductDescription.dart';
import 'package:go_green/main.dart';

class ProductDescriptionScreen extends StatelessWidget {
  static String id = 'product_description';

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final Product product = arg.product!;
    return Scaffold(
        backgroundColor: kScaffoldGrey,
        appBar: AppBar3(),
        body: SafeArea(
            child: ListView(children: [
          ProductImage(imgList: product.image),
          ProductName(
              name: product.name,
              short: product.short,
              price: product.price,
              cutPrice: product.cutPrice,
              discount: product.discount,
              rating: product.rating),
          FutureBuilder(
              future: getCompleteDescription(product.id, context),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          snapshot.data['Category'] != 'Accessory' &&
                                  snapshot.data['Category'] != 'Pot'
                              ? Specification(
                                  light: snapshot.data['Light'],
                                  water: snapshot.data['Water'],
                                  location: snapshot.data['IdealLocation'])
                              : Container(),
                          Description(
                              text: snapshot.data['Description'] == null
                                  ? ''
                                  : snapshot.data['Description']),
                          snapshot.data['Category'] != 'Accessory'
                              ? SizeWidget(
                                  height: snapshot.data['Height'],
                                  diameter: snapshot.data['Diameter'],
                                )
                              : Container(),
                          Availability(sellerId: snapshot.data['SellerId']),
                          RatingWidget(ratings: product.rating),
                          NewContainer(
                              child: Text(
                                  'Plants delivered will either be in a polythene or plastic pot.'))
                        ]);
                  } else {
                    return Center(child: Text('CheckConnection'));
                  }
                } else {
                  return CustomLoader();
                }
              })
        ])),
        bottomNavigationBar: ProductFooter(id: product.id));
  }
}

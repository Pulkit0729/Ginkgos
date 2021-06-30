import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/widgets/appBar3.dart';
import 'package:go_green/widgets/productDescrip/description.dart';
import 'package:go_green/widgets/productDescrip/productFooter.dart';
import 'package:go_green/widgets/productDescrip/productImage.dart';
import 'package:go_green/widgets/productDescrip/productName.dart';
import 'package:go_green/widgets/productDescrip/ratingWidget.dart';
import 'package:go_green/widgets/productDescrip/reviewWidget.dart';
import 'package:go_green/widgets/productDescrip/selectColor.dart';
import 'package:go_green/widgets/productDescrip/selectSize.dart';
import 'package:go_green/widgets/productDescrip/similarProduct.dart';
import 'package:go_green/widgets/productDescrip/specification.dart';
import 'package:go_green/widgets/productDescrip/suitableProduct.dart';

class ProductDescriptionScreen extends StatelessWidget {
  static String id = 'product_description';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar3(),
        body: ListView(
          children: [
            ProductImage(),
            ProductName(),
            Specification(),
            SelectSizeWidget(),
            SelectColor(),
            Description(),
            SimilarProduct(),
            SuitablePots(),
            RatingWidget(),
            ReviewsWidget(),
          ],
        ),
        bottomNavigationBar: ProductFooter());
  }
}

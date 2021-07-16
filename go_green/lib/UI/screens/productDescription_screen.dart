import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/widgets/appBar3.dart';
import 'package:go_green/UI/widgets/productDescrip/description.dart';
import 'package:go_green/UI/widgets/productDescrip/productFooter.dart';
import 'package:go_green/UI/widgets/productDescrip/productImage.dart';
import 'package:go_green/UI/widgets/productDescrip/productName.dart';
import 'package:go_green/UI/widgets/productDescrip/ratingWidget.dart';
import 'package:go_green/UI/widgets/productDescrip/reviewWidget.dart';
import 'package:go_green/UI/widgets/productDescrip/selectColor.dart';
import 'package:go_green/UI/widgets/productDescrip/selectSize.dart';
import 'package:go_green/UI/widgets/productDescrip/similarProduct.dart';
import 'package:go_green/UI/widgets/productDescrip/specification.dart';
import 'package:go_green/UI/widgets/productDescrip/suitableProduct.dart';

class ProductDescriptionScreen extends StatelessWidget {
  static String id = 'product_description';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldGrey,
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

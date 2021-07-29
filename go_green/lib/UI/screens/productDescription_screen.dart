import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/widgets/appBar3.dart';
import 'package:go_green/UI/widgets/productDescrip/description.dart';
import 'package:go_green/UI/widgets/productDescrip/productFooter.dart';
import 'package:go_green/UI/widgets/productDescrip/productImage.dart';
import 'package:go_green/UI/widgets/productDescrip/productName.dart';
import 'package:go_green/UI/widgets/productDescrip/ratingWidget.dart';
import 'package:go_green/UI/widgets/productDescrip/selectSize.dart';
import 'package:go_green/UI/widgets/productDescrip/specification.dart';
import 'package:go_green/backend/models/completeProductDescription.dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/main.dart';

class ProductDescriptionScreen extends StatefulWidget {
  static String id = 'product_description';

  @override
  _ProductDescriptionScreenState createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  late Product product;
  var description;
  bool _isLoading = true;
  void getSpec() async {
    description = await getCompleteDescription(product.id);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      var arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      product = arg.product!;
      getSpec();
    });
  }

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    product = arg.product!;
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
              rating: product.rating,
            ),
            _isLoading
                ? SpinKitRing(color: Colors.blue)
                : ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                        Specification(
                            light: description['Light'],
                            water: description['Water'],
                            location: description['Temp']),
                        Description(
                            text: description['Description'] == null
                                ? ''
                                : description['Description']),
                        SizeWidget(
                          height: description['Height'],
                          diameter: description['Diameter'],
                        ),
                        RatingWidget(ratings: product.rating),
                        Text(description['SellerId'].toString())
                      ])
          ]),
        ),
        bottomNavigationBar: ProductFooter(id: product.id));
  }
}

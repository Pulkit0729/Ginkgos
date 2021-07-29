import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/widgets/appBar3.dart';
import 'package:go_green/UI/widgets/productCard/productCard.dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/backend/provider/serverRequests/getProductList.dart';

class ProductListScreen extends StatelessWidget {
  static String id = 'productList';
  static String category = 'category';
  static String nonCategory = 'nonCategory';

  final String name;
  final String type;

  const ProductListScreen({required this.name, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar3(title: name),
        body: FutureBuilder(
            future: type == nonCategory
                ? getItemsIdList(name)
                : getProductsFromCategory(name),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data.toString() != '[]') {
                  return GridView.builder(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.3)),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard(
                          product: Product.fromJson(snapshot.data[index]),
                        );
                      });
                } else {
                  return Text('Check Internet Connection');
                }
              } else {
                return SpinKitCircle(color: Colors.blue);
              }
            }));
  }
}

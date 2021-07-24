import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/widgets/appBar3.dart';
import 'package:go_green/UI/widgets/productCard/productCard.dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/backend/provider/serverRequests/getProductList.dart';
import 'package:go_green/main.dart';

class ProductListScreen extends StatefulWidget {
  static String id = 'productList';
  final String name;

  const ProductListScreen({required this.name});
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar3(
          title: widget.name,
        ),
        body: FutureBuilder(
            future: getItemsIdList(widget.name),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
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

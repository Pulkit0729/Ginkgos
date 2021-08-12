import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/screens/productListScreen.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/UI/widgets/productCard/productCard(Home.dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/backend/provider/serverRequests/getProductList.dart';

class HomeLayout1 extends StatelessWidget {
  const HomeLayout1({Key? key, required this.name, required this.color})
      : super(key: key);

  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('  $name', style: kHomeLayoutTitle),
            TextButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductListScreen(
                            name: name,
                            type: ProductListScreen.nonCategory,
                          )));
                },
                child: Text('View all'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)))
          ]),
          SizedBox(height: 20),
          Container(
            color: Colors.white,
            child: FutureBuilder(
                future: getFourItemsList(name),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return FutureBuilder(
                          future: getProductsFromList(snapshot.data, context),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot1) {
                            if (snapshot1.connectionState ==
                                ConnectionState.done) {
                              if (snapshot1.hasData) {
                                return GridView.builder(
                                    physics: ClampingScrollPhysics(),
                                    itemCount: snapshot1.data.length,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 1),
                                    itemBuilder: (context, int index) {
                                      return ProductCard2(
                                          product: Product.fromJson(
                                              snapshot1.data[index]));
                                    });
                              } else {
                                return Text('Check Connections');
                              }
                            } else {
                              return CustomLoader();
                            }
                          });
                    } else {
                      return Text('Check Connections');
                    }
                  } else {
                    return CustomLoader();
                  }
                }),
          )
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/screens/productListScreen.dart';
import 'package:go_green/UI/widgets/productCard/productCard(Home.dart';
import 'package:go_green/backend/models/product.dart';
import 'package:go_green/backend/provider/serverRequests/getProductList.dart';

import '../customLoadingBar.dart';

class HomeLayout1 extends StatelessWidget {
  const HomeLayout1({Key? key, required this.name, required this.color})
      : super(key: key);

  final String name;
  final Color color;

  Future<dynamic> getItems() async =>
      await getProductsFromList(await getFourItemsList(name));

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
                future: getItems(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: 4,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1),
                        itemBuilder: (context, int index) {
                          return ProductCard2(
                              product: Product.fromJson(snapshot.data[index]));
                        });
                  } else {
                    return SpinKitCircle(color: Colors.blue);
                  }
                }),
          )
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';
import 'package:go_green/UI/widgets/productCard/productCard(ProductDescription).dart';
import 'container.dart';

class SimilarProduct extends StatelessWidget {
  const SimilarProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('View Similar', style: kSubHeading),
          SizedBox(
            height: 20,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard3(
                    name: 'Croton',
                    short: 'Indoor Plant',
                    price: '150',
                    cutPrice: '250',
                    discount: '40',
                    image: 'images/product.webp',
                  );
                },
              )),
        ],
      ),
    );
  }
}

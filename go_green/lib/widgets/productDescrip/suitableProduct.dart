import 'package:flutter/material.dart';
import 'package:go_green/constants/textStyles.dart';
import 'package:go_green/widgets/productDescrip/productCard3.dart';
import 'package:go_green/widgets/productDescrip/similarProduct.dart';

import '../productCard.dart';
import 'container.dart';

class SuitablePots extends StatelessWidget {
  const SuitablePots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Suitable Pots',
            style: ksubHeading,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.24,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard3();
                },
              )),
        ],
      ),
    );
  }
}

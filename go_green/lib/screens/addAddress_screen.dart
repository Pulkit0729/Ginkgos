import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/constants/colorsConstant.dart';
import 'package:go_green/constants/inputDecorations.dart';
import 'package:go_green/widgets/addAddress/typeOfAddress.dart';
import 'package:go_green/widgets/addAddress/addAddressFooter.dart';
import 'package:go_green/widgets/productDescrip/container.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);
  static String id = ' addAddressScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldGrey,
      appBar: AppBar(title: Text('Add Address')),
      body: ListView(
        children: [
          NewContainer(
              child: Column(children: [
            TextField(
              decoration: kAddressInputDeco.copyWith(labelText: 'Name'),
              keyboardType: TextInputType.name,
            ),
            TextField(
              decoration: kAddressInputDeco.copyWith(labelText: 'Mobile  No'),
              keyboardType: TextInputType.phone,
            )
          ])),
          NewContainer(
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                      child: TextField(
                    decoration:
                        kAddressInputDeco.copyWith(labelText: 'Pincode'),
                    keyboardType: TextInputType.number,
                  )),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                  Expanded(
                      child: TextField(
                          decoration:
                              kAddressInputDeco.copyWith(labelText: 'State'),
                          keyboardType: TextInputType.text))
                ]),
                TextField(
                    decoration:
                        kAddressInputDeco.copyWith(labelText: 'Address')),
                TextField(
                    decoration:
                        kAddressInputDeco.copyWith(labelText: 'Locality')),
                TextField(
                    decoration: kAddressInputDeco.copyWith(labelText: 'City')),
              ],
            ),
          ),
          TypeOfAddress()
        ],
      ),
      bottomNavigationBar: AddAddressFooter(),
    );
  }
}

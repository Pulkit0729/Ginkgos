import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';

class AddAddressFooter extends StatelessWidget {
  final function;

  const AddAddressFooter(this.function);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(7),
                  child: TextButton(
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(color: Colors.grey.shade300))),
                      onPressed: () {},
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ))))),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(right: 7),
                  child: TextButton(
                      onPressed: () async {
                        await function();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kSecondaryColor)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                            'SAVE',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )))))
        ],
      ),
    );
  }
}

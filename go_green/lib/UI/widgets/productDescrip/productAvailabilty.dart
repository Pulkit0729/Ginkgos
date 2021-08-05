import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/widgets/productDescrip/sellerInfo.dart';

import 'container.dart';

class Availability extends StatelessWidget {
  final sellerId;

  const Availability({Key? key, this.sellerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SellerInfo(sellerId: '123401001'),
          Row(children: [
            Expanded(
                child: Text('Check if this product is deliverable to you')),
            SizedBox(width: 10),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CheckBottomSheet(sellerId: sellerId);
                    });
              },
              child:
                  Text('Enter Pincode', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
            )
          ]),
        ],
      ),
    );
  }
}

class CheckBottomSheet extends StatefulWidget {
  final sellerId;
  const CheckBottomSheet({Key? key, this.sellerId}) : super(key: key);

  @override
  _CheckBottomSheetState createState() => _CheckBottomSheetState();
}

class _CheckBottomSheetState extends State<CheckBottomSheet> {
  late bool _isChecked;

  late bool _exist;

  late TextEditingController _pinCode;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<bool> _checkAvailability() async {
    var result = await FirebaseDatabase.instance
        .reference()
        .child('Nurseries')
        .child(_pinCode.text)
        .child(widget.sellerId.toString())
        .once()
        .then((value) => value.value);
    if (result != null && result != '') {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    _exist = false;
    _isChecked = false;
    _pinCode = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.45,
        padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.vertical),
        child: Wrap(children: [
          Form(
            key: _formKey,
            child: Row(children: [
              Expanded(
                  child: TextFormField(
                      decoration: InputDecoration(hintText: 'Pincode'),
                      controller: _pinCode,
                      onChanged: (va) {
                        setState(() {
                          _isChecked = false;
                          _exist = false;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        } else {
                          if (value.length != 6) {
                            return 'Invalid';
                          }
                        }
                      })),
              SizedBox(width: 20),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (await _checkAvailability()) {
                      setState(() {
                        _exist = true;
                        _isChecked = true;
                      });
                    } else {
                      setState(() {
                        _exist = false;
                        _isChecked = true;
                      });
                    }
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
              )
            ]),
          ),
          Text(
            _isChecked
                ? _exist
                    ? 'Deliverable'
                    : 'Not deliverable'
                : '',
            style: TextStyle(color: _exist ? Colors.green : Colors.red),
          )
        ]));
  }
}

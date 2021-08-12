import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/constants/inputDecorations.dart';
import 'package:go_green/UI/widgets/addAddress/addAddressFooter.dart';
import 'package:go_green/UI/widgets/addAddress/typeOfAddress.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/UI/widgets/customSnackBar.dart';
import 'package:go_green/UI/widgets/productDescrip/container.dart';
import 'package:go_green/backend/models/address.dart';
import 'package:go_green/backend/provider/serverRequests/getAddress.dart';
import 'package:go_green/backend/utilities/locFromPin.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import 'addressBook.dart';

class AddAddressScreen extends StatefulWidget {
  static String id = ' addAddressScreen';
  final Function? callback;

  const AddAddressScreen({Key? key, this.callback}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _state = TextEditingController();

  TextEditingController _city = TextEditingController();

  late String? _name;

  late String _phone;

  late String _pincode;

  late String _address;

  late String _locality;

  late String _type;

  Widget _inputName() => TextFormField(
      decoration: kAddressInputDeco.copyWith(labelText: 'Name'),
      keyboardType: TextInputType.name,
      onSaved: (value) {
        _name = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Required";
        }
      });

  Widget _inputPhone() => TextFormField(
      decoration:
          kAddressInputDeco.copyWith(labelText: 'Mobile  No', counterText: ''),
      keyboardType: TextInputType.phone,
      maxLength: 10,
      onSaved: (value) {
        _phone = value!;
      },
      validator: (value) {
        if (value!.length != 10) {
          return "Invalid Phone Number";
        }
      });

  Widget _inputPin(BuildContext context) => TextFormField(
      decoration:
          kAddressInputDeco.copyWith(labelText: 'PinCode', counterText: ''),
      keyboardType: TextInputType.number,
      maxLength: 6,
      validator: (value) {
        if (value!.isEmpty) {
          return "Invalid Pin";
        }
      },
      onChanged: (value) async {
        if (value.length == 6) {
          _pincode = value;

          Provider.of<LocFromPin>(context, listen: false)
              .getLocFromPin(value.toString());
        }
      });

  Widget _inputState(BuildContext context) => TextFormField(
      controller: _state,
      readOnly: true,
      decoration: kAddressInputDeco.copyWith(labelText: 'State'),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return "Required";
        }
      });

  Widget _inputAddress() => TextFormField(
      decoration: kAddressInputDeco.copyWith(labelText: 'Address'),
      validator: (value) {
        if (value!.isEmpty) {
          return "Required";
        }
      },
      onSaved: (value) {
        _address = value!;
      });

  Widget _inputLocality() => TextFormField(
      decoration: kAddressInputDeco.copyWith(labelText: 'Locality'),
      validator: (value) {
        if (value!.isEmpty) {
          return "Required";
        }
      },
      onSaved: (value) {
        _locality = value!;
      });

  Widget _inputCity(BuildContext context) => TextFormField(
      controller: _city,
      enabled: false,
      readOnly: true,
      decoration: kAddressInputDeco.copyWith(labelText: 'City'),
      validator: (value) {
        if (value!.isEmpty) {
          return "Required";
        }
      });

  void _onPress(BuildContext context) async {
    var arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    int? _selectedIndex = arg.index;
    if (!_formKey.currentState!.validate() || _type.isNotEmpty) {
      return;
    } else {
      LoadingBar.createLoading(context);
      _formKey.currentState!.save();
      AddressObject addressObject = AddressObject(
          name: _name,
          phone: _phone,
          pincode: _pincode,
          city: _city.text,
          state: _state.text,
          address: _address,
          locality: _locality,
          type: _type);
      bool _condition =
          await addAddress(addressObject, _selectedIndex.toString(), context);
      if (_condition) {
        Provider.of<LocFromPin>(context, listen: false).reset();
        Navigator.pop(context);
        CustomSnackWidgets.buildErrorSnackBar(context, "Added Successfully");
        if (_selectedIndex == 0) {
          Navigator.pop(context);
          Navigator.popAndPushNamed(context, AddressBookScreen.id);
        } else {
          Navigator.pop(context);
          widget.callback!();
        }
      } else {
        Provider.of<LocFromPin>(context, listen: false).reset();
        Navigator.pop(context);
        CustomSnackWidgets.buildErrorSnackBar(context, "An Error Occurred");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _state.text = Provider.of<LocFromPin>(context).state;
    _city.text = Provider.of<LocFromPin>(context).city;

    return WillPopScope(
        onWillPop: () async {
          var arg =
              ModalRoute.of(context)!.settings.arguments as ScreenArguments;
          int? _selectedIndex = arg.index;
          Provider.of<LocFromPin>(context, listen: false).reset();
          if (_selectedIndex == 1) {
            Navigator.pop(context);
            Navigator.pop(context);
          }
          return true;
        },
        child: Scaffold(
            backgroundColor: kScaffoldGrey,
            appBar: AppBar(title: Text('Add Address')),
            body: Form(
                key: _formKey,
                child: ListView(children: [
                  NewContainer(
                      child: Column(children: [_inputName(), _inputPhone()])),
                  NewContainer(
                      child: Column(children: [
                    Row(children: [
                      Expanded(child: _inputPin(context)),
                      Provider.of<LocFromPin>(context).loading
                          ? CustomLoader()
                          : Container(),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                      Expanded(child: _inputState(context))
                    ]),
                    _inputAddress(),
                    _inputLocality(),
                    _inputCity(context)
                  ])),
                  TypeOfAddress(function: (value) {
                    _type = value;
                  })
                ])),
            bottomNavigationBar: AddAddressFooter(() {
              _onPress(context);
            })));
  }
}

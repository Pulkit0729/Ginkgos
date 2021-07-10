import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/constants/inputDecorations.dart';
import 'package:go_green/firebase/createUser.dart';
import 'package:go_green/models/userdata.dart';
import 'package:go_green/screens/loadingScreen.dart';
import 'package:go_green/screens/main_screen.dart';
import 'package:go_green/widgets/customLoadingBar.dart';
import 'package:go_green/widgets/customSnackBar.dart';
import 'package:go_green/widgets/roundButton.dart';
import 'package:provider/provider.dart';

class NameScreen extends StatelessWidget {
  static String id = 'name_screen';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _validate(BuildContext context) async {
    if (_nameController.text.isEmpty) {
      CustomSnackWidgets.buildErrorSnackBar(context, 'Enter Valid Name');
    }
    if (_emailController.text.isEmpty ||
        EmailValidator.validate(_emailController.text) == false) {
      CustomSnackWidgets.buildErrorSnackBar(context, 'Enter Valid Email');
    } else {
      _create(context);
    }
  }

  Future<void> _create(BuildContext context) async {
    LoadingBar.createLoading(context);
    String trimmed = _nameController.text.trim();

    final condition = await createUser(
        trimmed[0].toUpperCase() + trimmed.substring(1), _emailController.text);

    if (condition) {
      print(condition);
      final bool cond1 = await addUser(
          trimmed[0].toUpperCase() + trimmed.substring(1),
          _emailController.text);

      ///Initialize provider///
      Provider.of<UserName>(context, listen: false).getData();

      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.id, (route) => false);
    } else {
      Navigator.pushNamed(context, LoadingScreen.id);
      CustomSnackWidgets.buildErrorSnackBar(context, 'An Error Occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
            leading: Container(),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Personal Details',
                style: TextStyle(color: Colors.black))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Tell Us a bit more about yourself.",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 19)),
              SizedBox(height: 30),
              Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
                      controller: _nameController,
                      autofocus: true,
                      decoration: kTextInputDeco.copyWith(
                          hintText: 'Name',
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.green,
                          )))),
              SizedBox(height: 10),
              Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: kTextInputDeco.copyWith(
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.green,
                          )))),
              SizedBox(height: 20),
              RoundButton(
                  text: 'Submit',
                  color: Colors.green,
                  function: () {
                    _validate(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

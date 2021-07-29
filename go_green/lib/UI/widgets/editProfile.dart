import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/inputDecorations.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _name;
  late TextEditingController _email;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _name = TextEditingController();
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
              key: _formKey,
              child: Wrap(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                            },
                            decoration:
                                kAddressInputDeco.copyWith(hintText: 'Name')),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _email,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  EmailValidator.validate(_email.text) ==
                                      false) {
                                return 'Invalid';
                              }
                            },
                            decoration:
                                kAddressInputDeco.copyWith(hintText: 'Email')),
                        SizedBox(height: 20),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {}
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ))
                      ]),
                ],
              ))),
    );
  }
}

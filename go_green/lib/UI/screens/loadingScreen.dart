import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/screens/verifyName_screen.dart';
import 'package:go_green/UI/widgets/customLoadingBar.dart';
import 'package:go_green/backend/models/userdata.dart';
import 'package:go_green/backend/provider/firebase/remote_config_service.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loadingScreen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = true;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('UsersV2');

  final auth = FirebaseAuth.instance;
  void route() async {
    await users
        .doc(auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        dynamic nestedName = documentSnapshot.get(FieldPath(['Name']));

        dynamic nestedEmail = documentSnapshot.get(FieldPath(['Email']));
        dynamic nestedPhone = documentSnapshot.get(FieldPath(['Phone']));
        Provider.of<Userdata>(context, listen: false)
            .setData(nestedName, nestedEmail, nestedPhone);

        Navigator.pushNamedAndRemoveUntil(
            context, MainScreen.id, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, NameScreen.id, (route) => false);
      }
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> getApiKey() async {
    var data =
        await FirebaseFirestore.instance.collection('Key').doc('Key').get();
    Provider.of<ServerConfig>(context, listen: false)
        .setData(data.data()!['api_key'], data.data()!['server_address']);
    route();
  }

  @override
  void initState() {
    getApiKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
              child: isLoading
                  ? CustomLoader()
                  : Column(children: [
                      Text('Your Internet Connection is off'),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              initState();
                              build(context);
                            });
                          },
                          child: Text('Refresh'))
                    ]))
        ])));
  }
}

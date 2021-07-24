import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/backend/models/userdata.dart';
import 'package:go_green/UI/screens/verifyName_screen.dart';
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
      FirebaseFirestore.instance.collection('users');

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

  @override
  void initState() {
    route();
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
                  ? SpinKitCircle(color: Colors.blue)
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

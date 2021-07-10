import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_green/models/userdata.dart';
import 'package:go_green/screens/verifyName_screen.dart';
import 'package:provider/provider.dart';
import 'main_screen.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loadingScreen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = true;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final auth = FirebaseAuth.instance;
  void route() async {
    var route = await users
        .doc(auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Provider.of<UserName>(context, listen: false).getData();
        return MainScreen.id;
      } else {
        return NameScreen.id;
      }
    });
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Future<void> checkConn() async {
    await initConnectivity();
    if (_connectionStatus == ConnectivityResult.none) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          isLoading = false;
        });
      });
    } else {
      route();
    }
  }

  @override
  void initState() {
    checkConn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: isLoading
                    ? SpinKitCircle(
                        color: Colors.blue,
                      )
                    : Column(
                        children: [
                          Text('Your Internet Connection is off'),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                  checkConn();
                                });
                              },
                              child: Text('Refresh'))
                        ],
                      )),
          ],
        ),
      ),
    );
  }
}

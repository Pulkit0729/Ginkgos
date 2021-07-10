import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserName extends ChangeNotifier {
  late String _name;
  late String _phone;
  late String _email;
  final _currentUser = FirebaseAuth.instance.currentUser;
  final _users = FirebaseFirestore.instance.collection('users');
  void getData() async {
    if (_currentUser != null) {
      _users
          .doc(_currentUser!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          try {
            dynamic nestedName = documentSnapshot.get(FieldPath(['Name']));
            dynamic nestedEmail = documentSnapshot.get(FieldPath(['Email']));
            _name = nestedName;
            _email = nestedEmail;
            _phone = _currentUser!.phoneNumber!;
          } on StateError catch (e) {
            print(e);
          }
        } else {}
      });
    }
  }

  String get name {
    return _name;
  }

  String get email {
    return _email;
  }

  String get phone {
    return _phone;
  }
}

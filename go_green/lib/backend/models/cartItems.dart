import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CartItems extends ChangeNotifier {
  bool _loading = true;
  late bool _exist;
  late Map<String, dynamic> _list;

  Future<void> getCartItems() async {
    final _uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      DocumentSnapshot<Map<String, dynamic>> snap = await FirebaseFirestore
          .instance
          .collection('UsersV2')
          .doc(_uid)
          .collection('IdCollection')
          .doc('Cart')
          .get();
      if (snap.data().toString() != '{}' && snap.exists) {
        _exist = true;
        notifyListeners();
        _list = snap.data()!;
        notifyListeners();
        _loading = false;
        notifyListeners();
      } else {
        _exist = false;
        notifyListeners();
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _exist = false;
      notifyListeners();
      _loading = false;
      notifyListeners();
    }
  }

  bool get exist {
    return _exist;
  }

  bool get loading {
    return _loading;
  }

  Map<String, dynamic> get list {
    return _list;
  }
}

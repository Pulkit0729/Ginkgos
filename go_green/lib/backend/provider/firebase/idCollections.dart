import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> addToIdCollection(String docID, String itemId) async {
  final _uid = FirebaseAuth.instance.currentUser!.uid;
  var _idCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(_uid)
      .collection('IdCollection');

  Future<bool> result =
      _idCollection.get().then((QuerySnapshot querySnapshot) async {
    if (querySnapshot.size > 0) {
      return _idCollection
          .doc(docID)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        try {
          var _nested = documentSnapshot.get(FieldPath([itemId]));
          return false;
        } catch (e) {
          print(e);
          try {
            _idCollection
                .doc(docID)
                .set({itemId: itemId}, SetOptions(merge: true));
            return true;
          } catch (e) {
            print(e);
            print('Error');
            return false;
          }
        }
      });
    } else {
      await _idCollection.doc(docID).set({itemId: itemId});
      return true;
    }
  });
  return result;
}

Future<void> removeFromCollection(String docID, String itemId) async {
  final _uid = FirebaseAuth.instance.currentUser!.uid;
  var _idCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(_uid)
      .collection('IdCollection');
  _idCollection
      .doc(docID)
      .update({itemId: FieldValue.delete()})
      .then((value) => print("User's Property Deleted"))
      .catchError((error) => print("Failed to delete user's property: $error"));
}

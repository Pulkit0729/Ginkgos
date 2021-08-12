import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/screens/faqScreen.dart';
import 'package:go_green/backend/utilities/urlLauncher.dart';

class HelpScreen extends StatelessWidget {
  static String id = 'helpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Help')),
        body: SafeArea(
            child: ListView(children: [
          ListTile(
              leading: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[200]!,
                  child: Icon(Icons.comment_sharp, color: kProfileItemsIcon)),
              title: Text('FAQ'),
              onTap: () => Navigator.pushNamed(context, FAQScreen.id)),
          ListTile(
              onTap: () async {
                openUrl('https://wa.me/' +
                    '91' +
                    await FirebaseFirestore.instance
                        .collection('Contact')
                        .doc('Contact')
                        .get()
                        .then((DocumentSnapshot snap) =>
                            snap.get(FieldPath(['phone']))));
              },
              leading: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[200]!,
                  child: Icon(Icons.chat_outlined, color: kProfileItemsIcon)),
              title: Text('Chat With Us')),
          ListTile(
            leading: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey[200]!,
                child: Icon(Icons.phone, color: kProfileItemsIcon)),
            title: Text('Contact Us'),
            onTap: () async {
              openUrl('tel:' +
                  await FirebaseFirestore.instance
                      .collection('Contact')
                      .doc('Contact')
                      .get()
                      .then((DocumentSnapshot snap) =>
                          snap.get(FieldPath(['phone']))));
            },
          )
        ])));
  }
}

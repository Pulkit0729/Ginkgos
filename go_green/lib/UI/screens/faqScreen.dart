import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FAQScreen extends StatelessWidget {
  static String id = 'FAQScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQ')),
      body: SafeArea(
        child: FutureBuilder(
            future: FirebaseDatabase.instance
                .reference()
                .child("FAQ's")
                .reference()
                .once()
                .then((value) => (value.value)),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int index) {
                      return FAQTile(
                          question: snapshot.data[index]['question'],
                          answer: snapshot.data[index]['answer']);
                    },
                  );
                } else {
                  return Text('NO data');
                }
              } else {
                return SpinKitCircle(
                  color: Colors.blue,
                );
              }
            }),
      ),
    );
  }
}

class FAQTile extends StatefulWidget {
  final String question;
  final String answer;

  const FAQTile({required this.question, required this.answer});
  @override
  _FAQTileState createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  String answer = '';
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 5),
        color: Colors.blue[100],
        child: ListTile(
          trailing: Icon(Icons.arrow_drop_down_outlined),
          title: Text(widget.question),
          onTap: () {
            setState(() {
              answer.isEmpty ? answer = widget.answer : answer = '';
            });
          },
        ),
      ),
      answer.isEmpty ? Container() : ListTile(title: Text(answer))
    ]);
  }
}

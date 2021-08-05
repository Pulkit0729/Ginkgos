import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_green/backend/utilities/urlLauncher.dart';
import 'package:share_plus/share_plus.dart';

class OrderSuccessful extends StatelessWidget {
  const OrderSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = AudioCache();
    player.play('success.wav');
    return AlertDialog(
        title: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text('Order Placed Successfuly', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          SvgPicture.asset('images/svg/Yay.svg',
              width: MediaQuery.of(context).size.width * 0.5)
        ]),
        actions: [
          Row(children: [
            Expanded(
                child: TextButton(
                    onPressed: () => _share(context),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red[300])),
                    child:
                        Text('Share', style: TextStyle(color: Colors.white)))),
            SizedBox(width: 10),
            Expanded(
              child: TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await openUrl(
                        'https://play.google.com/store/apps/details?id=com.last.go_green');
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[300])),
                  child:
                      Text('Rate Us', style: TextStyle(color: Colors.white))),
            )
          ])
        ]);
  }
}

void _share(BuildContext context) async {
  final box = context.findRenderObject() as RenderBox?;

  await FirebaseFirestore.instance
      .collection('Contact')
      .doc('Contact')
      .get()
      .then((value) async {
    dynamic _nestedShare = value.get(FieldPath(['share']));
    await Share.share(_nestedShare,
        subject: 'Check this out',
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  });
}

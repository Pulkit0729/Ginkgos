import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SvgPicture.asset('images/svg/comingSoon.svg',
              width: MediaQuery.of(context).size.width * 0.7),
          SizedBox(height: 20),
          Text('Coming Soon to your Location', style: TextStyle(fontSize: 18))
        ]),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'))
        ]);
  }
}

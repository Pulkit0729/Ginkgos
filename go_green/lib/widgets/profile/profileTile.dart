import 'package:flutter/material.dart';
import 'package:go_green/constants/colorsConstant.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({this.iconData, this.text, this.function});
  final iconData;
  final text;
  final function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.grey[200]!,
          child: Icon(
            iconData,
            color: kProfileItemsIcon,
          )),
      title: Text(text),
      onTap: () {
        Navigator.pushNamed(context, function());
      },
    );
  }
}

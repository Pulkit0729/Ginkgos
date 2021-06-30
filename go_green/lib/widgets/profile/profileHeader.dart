import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 15, left: 15),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pulkit',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5),
              Text(
                '+918059345289',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5),
              Text('pulkit0729@gmail.com',
                  style: TextStyle(
                    fontSize: 15,
                  ))
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 40,
          ),
        ],
      ),
    );
  }
}

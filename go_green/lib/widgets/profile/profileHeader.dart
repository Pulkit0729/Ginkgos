import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/models/userdata.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
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
                Provider.of<UserName>(context).name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 5),
              Text(
                Provider.of<UserName>(context).phone,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5),
              Text(Provider.of<UserName>(context).email,
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

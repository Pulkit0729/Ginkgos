import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/widgets/cartScreen/cartStageWidget.dart';

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  AppBar2(this.title, this.stage);
  final String title;
  final int stage;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CartStage(
          index: stage,
        ),
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize =>
      new Size.fromHeight(AppBar().preferredSize.height * 1.6);
}

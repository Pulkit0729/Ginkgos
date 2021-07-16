import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';

class CartStageSliderActive extends StatelessWidget {
  const CartStageSliderActive({
    Key? key,
    required Animation animation,
  })  : _animation = animation,
        super(key: key);

  final Animation _animation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Expanded(
                flex: (_animation.value * 100).toInt(),
                child: Container(height: 2, color: kPrimaryColor)),
            Expanded(
                flex: (100.00 - _animation.value * 100).toInt(),
                child: Container(height: 2, color: Colors.grey[200])),
            CircleAvatar(
              radius: 3,
              backgroundColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}

class CartStageSliderInactive extends StatelessWidget {
  const CartStageSliderInactive({Key? key, this.color}) : super(key: key);

  final color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Expanded(child: Container(height: 2, color: color)),
            CircleAvatar(
              radius: 3,
              backgroundColor: color,
            )
          ],
        ),
      ),
    );
  }
}

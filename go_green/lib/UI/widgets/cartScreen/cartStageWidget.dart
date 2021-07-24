import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/colorsConstant.dart';
import 'package:go_green/UI/constants/textStyles.dart';

class CartStage extends StatefulWidget {
  const CartStage({
    this.index,
  });
  final index;

  @override
  _CartStageState createState() => _CartStageState();
}

class _CartStageState extends State<CartStage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late final index;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.decelerate);

    _animationController.forward();

    _animationController.addListener(() {
      setState(() {});
    });

    index = widget.index;

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(children: [
          index == 0
              ? CartStageSliderActive(animation: _animation)
              : CartStageSliderInactive(color: Colors.green),
          CartStageText(text: 'Cart'),
          index == 1
              ? CartStageSliderActive(animation: _animation)
              : index == 0
                  ? CartStageSliderInactive(color: Colors.grey[300])
                  : CartStageSliderInactive(color: Colors.green),
          CartStageText(text: 'Address'),
          index == 2
              ? CartStageSliderActive(animation: _animation)
              : CartStageSliderInactive(color: Colors.grey[300]),
          CartStageText(text: 'Payment')
        ]));
  }
}

class CartStageText extends StatelessWidget {
  const CartStageText({
    this.text,
  });
  final text;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Text(text, style: kCartStageText));
  }
}

class CartStageSliderActive extends StatelessWidget {
  const CartStageSliderActive({
    required Animation animation,
  }) : _animation = animation;

  final Animation _animation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(children: [
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
            ])));
  }
}

class CartStageSliderInactive extends StatelessWidget {
  const CartStageSliderInactive({this.color});

  final color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(children: [
              Expanded(child: Container(height: 2, color: color)),
              CircleAvatar(radius: 3, backgroundColor: color)
            ])));
  }
}

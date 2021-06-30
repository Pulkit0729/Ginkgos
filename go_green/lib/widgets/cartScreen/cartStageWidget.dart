import 'package:flutter/material.dart';

import 'cartStageSlider.dart';

class CartStage extends StatefulWidget {
  const CartStage({
    Key? key,
    this.index,
  }) : super(key: key);
  final index;
  @override
  _CartStageState createState() => _CartStageState();
}

class _CartStageState extends State<CartStage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late final index1;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.decelerate);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    index1 = widget.index;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            index1 == 0
                ? CartStageSliderActive(animation: _animation)
                : CartStageSliderInactive(
                    color: Colors.green,
                  ),
            CartStageText(
              text: 'Cart',
            ),
            index1 == 1
                ? CartStageSliderActive(animation: _animation)
                : index1 == 0
                    ? CartStageSliderInactive(
                        color: Colors.grey[300],
                      )
                    : CartStageSliderInactive(
                        color: Colors.green,
                      ),
            CartStageText(
              text: 'Address',
            ),
            index1 == 2
                ? CartStageSliderActive(animation: _animation)
                : CartStageSliderInactive(
                    color: Colors.grey[300],
                  ),
            CartStageText(
              text: 'Payment',
            ),
          ],
        ));
  }
}

class CartStageText extends StatelessWidget {
  const CartStageText({
    Key? key,
    this.text,
  }) : super(key: key);
  final text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}

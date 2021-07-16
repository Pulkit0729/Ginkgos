import 'package:flutter/material.dart';

class SpecIconWidget extends StatelessWidget {
  const SpecIconWidget(
      {this.iconData, required this.opacity, this.function, this.color});
  final iconData;
  final color;
  final double opacity;
  final function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            child: Icon(
              iconData,
              color: Colors.blueGrey,
              size: 20,
            ),
            onPressed: () {
              function();
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                backgroundColor: MaterialStateProperty.all(color))),
        Opacity(
          opacity: opacity,
          child: Container(
            child: CustomPaint(painter: Triangle()),
            width: MediaQuery.of(context).size.width * 0.06,
            height: 20,
          ),
        ),
      ],
    );
  }
}

class Triangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var arrowColor = Colors.pink[100];
    paint.color = arrowColor!;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.5, 0);

    canvas.drawPath(path, paint);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

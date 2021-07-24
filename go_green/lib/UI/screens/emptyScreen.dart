import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyScreen extends StatelessWidget {
  final image;
  final function;
  final text;
  const EmptyScreen({Key? key, this.image, this.function, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                  child: SvgPicture.asset(image,
                      width: MediaQuery.of(context).size.width * 0.5)),
              SizedBox(height: 20),
              Text(text,
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              function != null
                  ? Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text('Shop Now',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.green,
                              fontWeight: FontWeight.w700)))
                  : Container()
            ])));
  }
}

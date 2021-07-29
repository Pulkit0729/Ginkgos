import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';

import 'container.dart';

class Description extends StatefulWidget {
  const Description({
    this.text,
  });
  final text;

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return NewContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Description',
            style: kSubHeading,
          ),
          DescriptionTextWidget(text: widget.text),
        ],
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  DescriptionTextWidget({required this.text});
  final String text;

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    final length = 100;

    if (widget.text.length > length) {
      firstHalf = widget.text.substring(0, length);
      secondHalf = widget.text.substring(length, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.symmetric(vertical: 10.0),
        child: secondHalf.isEmpty
            ? Text(firstHalf)
            : Column(children: <Widget>[
                Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
                InkWell(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(flag ? "+ More" : "- Less",
                              style: TextStyle(color: Colors.blue))
                        ]),
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    })
              ]));
  }
}

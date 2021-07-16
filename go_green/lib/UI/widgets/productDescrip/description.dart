import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_green/UI/constants/textStyles.dart';

import 'container.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

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
          DescriptionTextWidget(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
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
          : Column(
              children: <Widget>[
                Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
                InkWell(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          flag ? "+ More" : "- Less",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ]),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}

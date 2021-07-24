import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({this.type, required this.items, this.callBack});
  final callBack;
  final type;
  final List<String> items;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String _value;

  void _handleClick(value) {
    setState(() {
      _value = value;
    });
    widget.callBack(value);
  }

  @override
  void initState() {
    _value = widget.items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: PopupMenuButton(
          onSelected: _handleClick,
          child: Text(widget.type + ': ' + _value),
          itemBuilder: (BuildContext context) {
            return widget.items.map((e) {
              return PopupMenuItem<String>(
                value: e.toString(),
                child: Text(e.toString()),
              );
            }).toList();
          },
        ));
  }
}

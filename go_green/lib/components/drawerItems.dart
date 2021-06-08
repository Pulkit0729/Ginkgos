import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildHeader(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildItems(BuildContext context);
}

class HeaderItem implements ListItem {
  HeaderItem({required this.heading});
  late String heading;
  @override
  Widget buildHeader(BuildContext context) {
    return DrawerHeader(
      child: Text(heading),
      decoration: BoxDecoration(color: Colors.blue),
    );
  }

  @override
  Widget buildItems(BuildContext context) => SizedBox(
        height: 0,
      );
}

class MessageItem implements ListItem {
  MessageItem(this.sender, this.function);
  final String sender;
  final function;

  @override
  Widget buildHeader(BuildContext context) => ListTile(
        title: Text(sender),
        onTap: function,
      );
  @override
  Widget buildItems(BuildContext context) => SizedBox(
        height: 0,
      );
}

/////Secondary Object/////////
class NavItem {
  late String title;
  late Function function;
  NavItem(String q, Function a) {
    title = q;
    function = a;
  }
}

////List of text's in drawer/////
class AnotherList {
  AnotherList(this.drawerItems);
  final List<NavItem> drawerItems;
  List<ListItem> getItems() {
    List<ListItem> _headerList = [HeaderItem(heading: 'heading')];
    List<ListItem> _itemList =
        drawerItems.map((e) => MessageItem(e.title, e.function)).toList();
    List<ListItem> drawerList = _headerList + _itemList; ////final lis
    return drawerList;
  }
}

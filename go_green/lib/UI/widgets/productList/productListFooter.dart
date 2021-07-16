import 'package:flutter/material.dart';

class ProductListFooter extends StatelessWidget {
  const ProductListFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black, width: 0.2))),
      child: Row(
        children: [
          Expanded(
              child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sort_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
                Text('SORT',
                    style: TextStyle(fontSize: 16, color: Colors.black54)),
              ],
            ),
          )),
          Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey[200]!),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  Text(
                    'FILTER',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

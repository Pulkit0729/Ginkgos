import 'package:flutter/material.dart';
import 'package:go_green/UI/widgets/productCard/productCard(Home.dart';

class HomeLayout1 extends StatelessWidget {
  const HomeLayout1({
    Key? key,
    this.heading,
    this.function,
    required this.images,
    required this.name,
  }) : super(key: key);
  final heading;
  final function;
  final List<String> images;
  final List<String> name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  function();
                },
                child: Text('View all'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ProductCard2(
                          image: images[0],
                          price: name[0],
                        ),
                      ),
                      Expanded(
                        child: ProductCard2(
                          image: images[1],
                          price: name[1],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ProductCard2(
                          image: images[2],
                          price: name[2],
                        ),
                      ),
                      Expanded(
                        child: ProductCard2(
                          image: images[3],
                          price: name[3],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

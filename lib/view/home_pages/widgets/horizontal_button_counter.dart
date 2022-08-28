import 'package:carrot/model/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:math';

// ignore: must_be_immutable
class HorizontalButtonCounter extends StatelessWidget {
  HorizontalButtonCounter({Key? key}) : super(key: key);
  void _increment(BuildContext context) {
    Provider.of<ProductsProvider>(context, listen: false).increaseQuantity();
  }

  void _decrement(BuildContext context) {
    Provider.of<ProductsProvider>(context, listen: false).decreaseQuantity();
  }

  int count = 0;
  var rnd = Random();
  
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductsProvider>(context,listen: false);
    count = provider.items[provider.selectedItem['name']];
    return Center(
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 60,
            child: FloatingActionButton(
              heroTag: "${rnd.nextInt(500)}",
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              onPressed: () => _increment(context),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              child: const Icon(
                Icons.remove,
                color: Color.fromARGB(255, 0, 204, 105),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 60,
            child: FloatingActionButton(
              heroTag: "${rnd.nextInt(500)}",
              shape: const BeveledRectangleBorder(),
              onPressed: () {},
              backgroundColor: const Color.fromARGB(255, 82, 204, 109),
              child: Text(
                "$count",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 60,
            child: FloatingActionButton(
              heroTag: "${rnd.nextInt(500)}",
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              onPressed: () => _decrement(context),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              child: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 0, 204, 105),
              ),
            ),
          )
        ],
      ),
    );
  }
}

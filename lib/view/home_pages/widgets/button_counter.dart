import 'package:carrot/model/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:math';

class ButtonCounter extends StatelessWidget {
  ButtonCounter({Key? key,int? index}) : super(key: key){
    this.index = index!;
  }

  void _increment(BuildContext context) {
    Provider.of<ProductsProvider>(context, listen: false).increaseQuantity();
  }

  void _decrement(BuildContext context) {
    Provider.of<ProductsProvider>(context, listen: false).decreaseQuantity();
  }

  void _addItem(BuildContext context) {
    Provider.of<ProductsProvider>(context, listen: false).addItem();
  }

  int index = 0;
  var rnd = Random();
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<ProductsProvider>(context, listen: false).currentCount;
    if (count == 0) {
      Provider.of<ProductsProvider>(context,listen: false).selectItem(index);
      return Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 34,
          height: 35,
          child: FloatingActionButton(
            heroTag: "con",
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            onPressed: () => _addItem(context),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 0, 204, 105),
            ),
          ),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.topRight,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 30,
              width: 34,
              child: FloatingActionButton(
                heroTag: "${rnd.nextInt(500)}",
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                onPressed: () => _decrement(context),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: const Icon(
                  Icons.remove,
                  color: Color.fromARGB(255, 0, 204, 105),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              width: 34,
              child: FloatingActionButton(
                heroTag: "${rnd.nextInt(500)}",
                shape: const BeveledRectangleBorder(),
                onPressed: null,
                backgroundColor: const Color.fromARGB(255, 0, 204, 105),
                child: Text(
                  "$count",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              width: 34,
              child: FloatingActionButton(
                heroTag: "${rnd.nextInt(500)}",
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                onPressed: () => _increment(context),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 204, 105),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
//${Provider.of<ProductsProvider>(context,listen: false).itemIndex}
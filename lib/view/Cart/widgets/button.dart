import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/providers/products_provider.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({Key? key,required index}) : super(key: key){
    this.index = index!; }

  void _increment(BuildContext context) {
    _selectItem(context);
    provider.increaseQuantity();
  }

  void _decrement(BuildContext context) {
    _selectItem(context);
    provider.decreaseQuantity();
  }

  void _selectItem(BuildContext context) {
    itemIndex = (provider.cartItemsSaved[index].id)%10 - 1;
    provider.selectItem(itemIndex);
  }
  // ignore: prefer_typing_uninitialized_variables
  var provider;
  // ignore: prefer_typing_uninitialized_variables
  var item;
  int index = 0;
  int itemIndex = 0;
  var rnd = Random();
  @override
  Widget build(BuildContext context) {
    
    provider = Provider.of<ProductsProvider>(context, listen: false);
    var count = provider.items[provider.cartItemsSaved[index].name] ;

    return Row(
      children: [
        SizedBox(
          height: 34,
          width: 35,
          child: FloatingActionButton(
            heroTag: "${rnd.nextInt(500)}",
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5))),
            onPressed: () => _decrement(context),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: Builder(
              builder: (context) {
                if(count == 1){
                  return const Icon(
                  Icons.delete_outline_rounded,
                  color: Color.fromARGB(255, 0, 204, 105),
                );
                }
                return const Icon(
                  Icons.remove,
                  color: Color.fromARGB(255, 0, 204, 105),
                );
              }
            ),
          ),
        ),
        SizedBox(
          height: 34,
          width: 35,
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
          height: 34,
          width: 35,
          child: FloatingActionButton(
            heroTag: "${rnd.nextInt(500)}",
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5))),
            onPressed: () => _increment(context),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 0, 204, 105),
            ),
          ),
        )
      ],
    );
  }
}

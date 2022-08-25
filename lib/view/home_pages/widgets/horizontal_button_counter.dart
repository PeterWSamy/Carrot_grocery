import 'package:carrot/model/providers/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:math';

// ignore: must_be_immutable
class HorizontalButtonCounter extends StatelessWidget {
  HorizontalButtonCounter({Key? key}) : super(key: key);
  void _increment(BuildContext context) {
    Provider.of<CountProvider>(context, listen: false).increment();
  }

  void _decrement(BuildContext context) {
    Provider.of<CountProvider>(context, listen: false).decrement();
  }

  var rnd = Random();
  @override
  Widget build(BuildContext context) {
    return Row(
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
              Icons.add,
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
            onPressed: () => _increment(context),
            backgroundColor: Color.fromARGB(255, 82, 204, 109),
            child: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 255, 255, 255),
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
    );
  }
}

//${Provider.of<ProductsProvider>(context,listen: false).itemIndex}

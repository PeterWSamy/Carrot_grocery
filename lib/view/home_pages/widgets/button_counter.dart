import 'package:carrot/model/providers/count_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonCounter extends StatelessWidget {
  ButtonCounter({Key? key}) : super(key: key);
  void _increment(BuildContext context){
    Provider.of<CountProvider>(context,listen: false).increment();
  }
  void _decrement(BuildContext context){
    Provider.of<CountProvider>(context,listen: false).decrement();
  }
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<CountProvider>(context,listen: false).count;
    if (count == 0) {
      return Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 34,
          height: 35,
          child: FloatingActionButton(
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            onPressed: () => _increment(context),
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
        child: SizedBox(
          width: 34,
          height: 40,
          child: ButtonBar(
            mainAxisSize: MainAxisSize.max,
            buttonPadding: const EdgeInsets.all(0),
            children: <Widget>[
              FloatingActionButton(
                shape: const BeveledRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))),
                onPressed: ()=> _decrement(context),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: const Icon(
                  Icons.remove,
                  color: Color.fromARGB(255, 0, 204, 105),
                ),
              ),
              FloatingActionButton(
                shape: const BeveledRectangleBorder(),
                onPressed: null,
                backgroundColor: const Color.fromARGB(255, 0, 204, 105),
                child: Text(
                  "${count}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              FloatingActionButton(
                shape: const BeveledRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))),
                onPressed: () => _increment(context),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 204, 105),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

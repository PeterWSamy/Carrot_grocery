import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartPage extends StatelessWidget {
 CartPage({Key? key}) : super(key: key);

  final products = Hive.box("cart") ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products.get(index);
          return ListTile(
            title: Text("${product.name}"),
          );
        },
      ),
    );
  }
}
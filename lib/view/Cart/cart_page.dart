import 'package:carrot/model/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    
    var provider = Provider.of<ProductsProvider>(context,listen: false);
    ValueNotifier cartI = ValueNotifier(provider.cartItemsSaved);
        return Scaffold(
          body: ValueListenableBuilder<dynamic>(
            valueListenable: cartI,
            builder: (context,dynamic cart, Widget? child){
            return ListView.builder(
              itemCount: provider.cartItemsSaved.length,
              itemBuilder: (context, index) {
                var product = provider.cartItemsSaved[index];
                return Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 238, 238, 238),
                      ),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.network(product.image)),
                    ),
                    Text("${product.name}"),
                  ],
                );
              },
            );}
          ),
        );
  }
}

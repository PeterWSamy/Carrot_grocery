import 'package:carrot/model/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.white, actions: [
            const Padding(padding: EdgeInsets.all(4.0)),
            const IconButton(onPressed: null,alignment: Alignment.centerLeft, icon: Icon(Icons.close),color: Colors.black,),
            const Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Cart",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ))),
            IconButton(
                onPressed: () => state.deleteDataBase(),
                icon: const Icon(Icons.delete_outline),
                color: Colors.black,
                
                ),
          ]),
          body: Consumer<ProductsProvider>(
            builder: (context, state, child) {
              if (Provider.of<ProductsProvider>(context, listen: false)
                  .cartItemsSaved
                  .isEmpty) {
                return Scaffold(
                  body: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 30.0),
                          child: Image.asset('assets/images/Image.png'),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Your cart is empty",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          "Looks like you haven't made",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "your choice yet",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          height: 60,
                          width: 320,
                          child: FloatingActionButton(
                            onPressed: null,
                            backgroundColor: Color.fromARGB(255, 82, 205, 109),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "Start shopping",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const CartPage();
              }
            },
          ),
        );
      },
    );
  }
}

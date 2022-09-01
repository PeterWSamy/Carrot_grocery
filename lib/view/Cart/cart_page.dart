import 'package:carrot/model/product.dart';
import 'package:carrot/model/providers/products_provider.dart';
import 'package:carrot/view/Cart/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductsProvider>(context, listen: false);
    ValueNotifier cartI = ValueNotifier<dynamic>(provider.products);
    return Consumer<ProductsProvider>(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ValueListenableBuilder<dynamic>(
              valueListenable: cartI,
              builder: (context, cart, child) {
                return Stack(
                  children: [
                    ListView.builder(
                      itemCount: provider.cartItemsSaved.length,
                      itemBuilder: (context, index) {
                        var product = provider.cartItemsSaved[index];
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15.0, 20, 15, 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          255, 245, 245, 245),
                                      border: Border.all(color: Colors.black12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Image.network(product.image)),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0, 0, 0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              product.name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 4, 0, 4),
                                              child: Text(
                                                product.weight,
                                                style: const TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\$${product.price}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Color.fromARGB(
                                                      255, 82, 205, 109)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Button(index: index),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 2,
                              thickness: 2,
                              color: Colors.black12,
                            )
                          ],
                        );
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 70,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )),
                              onPressed: null,
                              child: Text(
                                "\$${provider.totalPrice.toStringAsFixed(2)}",
                                style:
                                    const TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 300,
                            child: FloatingActionButton(
                              backgroundColor: const Color.fromARGB(255, 82, 205, 109),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                                onPressed: (){
                                  Navigator.of(context).pushNamed("/checkout");
                                },
                                child: const Text(
                                  "Checkout",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
        );
      },
    );
  }
}

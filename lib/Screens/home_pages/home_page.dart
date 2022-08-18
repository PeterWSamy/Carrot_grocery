import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsProvider(),
      child: Consumer<ProductsProvider>(
        builder: (context, state, child) {
          state.loadDB();
          if (state.data.length > 0) {
            return Scaffold(
              backgroundColor: Color.fromARGB(31, 240, 240, 240),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 190,
                        width: 320,
                        child: Image.asset("assets/images/Campaign.png"),
                      ),
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.all(5.0),
                    shrinkWrap: true,
                    itemCount: 7,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(

                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Text(
                              state.data[index]['name'],
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              height: 50,
                              width: 70,
                              child: Image.network(state.data[index]['image']),
                            )
                            
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

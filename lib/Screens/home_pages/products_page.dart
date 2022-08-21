import 'package:carrot/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Provider.of<ProductsProvider>(context, listen: false)
            .selectedCategory !=
        null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(Provider.of<ProductsProvider>(context, listen: false)
              .selectedCategory?['name']),
          actions: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon : const Icon(Icons.arrow_back_ios),
                  color: Colors.black87,
                  alignment: Alignment.topLeft,
                  onPressed: (){Navigator.of(context).pushNamed("/home");},
                ),
            ),
          
          ],
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(5.0),
          shrinkWrap: true,
          itemCount: Provider.of<ProductsProvider>(context, listen: false)
              .selectedCategory?['items']
              .length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 110,
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Image.network(
                        Provider.of<ProductsProvider>(context, listen: false)
                            .selectedCategory?['items'][index]['image']),
                  ),
                  Column(
                    children: [
                      Text(
                        "\$${Provider.of<ProductsProvider>(context, listen: false).selectedCategory?['items'][index]['price']}",
                        style: const TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          Provider.of<ProductsProvider>(context, listen: false)
                              .selectedCategory?['items'][index]['name'],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        "${Provider.of<ProductsProvider>(context, listen: false).selectedCategory?['items'][index]['weight']}",
                        style: const TextStyle(color: Colors.black45),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }
  }
}

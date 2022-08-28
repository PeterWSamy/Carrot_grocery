import 'package:carrot/view/home_pages/widgets/horizontal_button_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/providers/products_provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = Provider.of<ProductsProvider>(context,listen: false).currentCount;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("product details"),
          actions: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black87,
                onPressed: () {
                  Navigator.of(context).pushNamed("/products");
                },
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Product details",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite_border,
                color: Colors.black87,
              ),
            ),
          ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: 180,
              width: 180,
              child: Image.network(
                  Provider.of<ProductsProvider>(context, listen: false)
                      .selectedItem['image']),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "\$${Provider.of<ProductsProvider>(context, listen: false).selectedItem["price"]}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 82, 205, 109)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "${Provider.of<ProductsProvider>(context, listen: false).selectedItem["name"]}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            Text(
              "${Provider.of<ProductsProvider>(context, listen: false).selectedItem["weight"]}",
              style: const TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 191, 191, 191)),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Product description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 320,
              child: Align(
                alignment: Alignment.topLeft,
                child: Expanded(
                  child: Text(
                    "${Provider.of<ProductsProvider>(context, listen: false).selectedItem["description"]}",
                    style: const TextStyle(fontSize: 13, color: Colors.black45),
                  ),
                ),
              ),
            ),
            Builder(builder: (context) {
              if (count == 0) {
                return SizedBox(
                  width: 380,
                  height: 60,
                  child: FloatingActionButton(
                    heroTag:
                        "${Provider.of<ProductsProvider>(context, listen: false).selectedItem['name']}",
                    backgroundColor: const Color.fromARGB(255, 82, 205, 109),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () {},
                  ),
                );
              } else {
                return HorizontalButtonCounter();
              }
            }),
          ]),
        ),
      ),
    );
  }
}

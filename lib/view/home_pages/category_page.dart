import 'package:carrot/model/providers/products_provider.dart';
import 'package:carrot/view/home_pages/widgets/category_item.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(Provider.of<ProductsProvider>(context, listen: false)
              .selectedCategory['name']),
          actions: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black87,
                onPressed: () {
                  Navigator.of(context).pushNamed("/home");
                },
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.center,
              child: Text(
                Provider.of<ProductsProvider>(context, listen: false)
                    .selectedCategory['name'],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ))
          ],
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(5.0),
          shrinkWrap: true,
          itemCount: Provider.of<ProductsProvider>(context, listen: false)
              .selectedCategory?['items']
              .length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            mainAxisExtent: 220,
          ),
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(index: index);
          },
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}

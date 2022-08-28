import 'package:carrot/view/home_pages/widgets/button_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/providers/products_provider.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key, int? index}) : super(key: key) {
    this.index = index!;
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Provider.of<ProductsProvider>(context, listen: false)
                .selectItem(index);
            Navigator.of(context).pushNamed("/product_details");
          },
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 247, 247, 247),
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: SizedBox(
                  height: 90,
                  width: 90,
                  child: Image.network(
                      Provider.of<ProductsProvider>(context, listen: false)
                          .selectedCategory?['items'][index]['image']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$${Provider.of<ProductsProvider>(context, listen: false).selectedCategory['items'][index]['price']}",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 82, 205, 109),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Provider.of<ProductsProvider>(context, listen: false)
                        .selectedCategory?['items'][index]['name'],
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${Provider.of<ProductsProvider>(context, listen: false).selectedCategory['items'][index]['weight']}",
                    style: const TextStyle(color: Colors.black45, fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 5,
          child: ButtonCounter(index: index),
        ),
      ],
    );
  }
}

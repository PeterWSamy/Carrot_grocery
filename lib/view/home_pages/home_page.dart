import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/providers/products_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, state, child) {
        state.loadDB();
        if (state.data.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              actions: const [
                Image(
                  image: AssetImage(
                    "assets/images/Group_7001.png",
                  ),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Carrot",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )),
                Icon(
                  Icons.location_on,
                  color: Colors.black54,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Home  ",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    )),
              ],
              backgroundColor: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(31, 240, 240, 240),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
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
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 150,
                      width: 110,
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          state.selectCategory(index);
                          Navigator.of(context).pushNamed("/products");
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                state.data[index]['name'],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              width: 90,
                              child: Image.network(state.data[index]['image']),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

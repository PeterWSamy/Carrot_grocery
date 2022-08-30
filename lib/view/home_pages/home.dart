import 'package:carrot/model/providers/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'package:carrot/view/home_pages/home_page.dart';
import 'package:carrot/view/search_page.dart';
import 'package:carrot/view/Cart/cart.dart';
import 'package:carrot/view/campaigns.dart';
import 'package:carrot/view/profile_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const SearchPage(),
    const Cart(),
    const Campaigns(),
    const ProfilePage()
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Hive.openBox("carts"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text("Error");
            } else {
              return Consumer<Indexprovider>(builder: (context, state, child) {
                return Scaffold(
                    body: Center(
                        child: Home._pages.elementAt(state.selectedItem)),
                    bottomNavigationBar: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: "Home"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: "Search"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart), label: "Cart"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.card_giftcard_rounded),
                            label: "Campains"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person), label: "profile"),
                      ],
                      selectedItemColor: Colors.green[400],
                      unselectedItemColor: Colors.black54,
                      currentIndex: state.selectedItem,
                      onTap: (index) => state.onTapped(index),
                    ));
              });
            }
          } else {
            return const Scaffold();
          }
        });
  }

  @override
  void dispose() {
    Hive.box('carts').compact();
    Hive.close();
    super.dispose();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../cart.dart';

class ProductsProvider extends ChangeNotifier{
  var db = FirebaseFirestore.instance;
  List data = [] ;
  // ignore: prefer_typing_uninitialized_variables
  var selectedCategory ;
  // ignore: prefer_typing_uninitialized_variables
  var selectedItem ;
  int itemIndex = 0;
  int categoryIndex = 0;

  List cartItems = [];

  Future<void> loadDB() async {
     await db.collection("categories").get().then((event) {
      for (var doc in event.docs) {
        data.add(doc);
      }
    });
   // print("done");
    notifyListeners();
  }
  void selectCategory(int index){
    categoryIndex = index;
    selectedCategory = data[index];
    notifyListeners();
  }

  void selectItem(int index){
    itemIndex = index;
    selectedItem = selectedCategory["items"][index];
    notifyListeners();
  }

  void addItem(String name){
    CartItem item = CartItem(name, 0);
    cartItems.add(item);
  }
}

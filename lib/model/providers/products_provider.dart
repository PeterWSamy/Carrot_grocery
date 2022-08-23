import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider extends ChangeNotifier{
  var db = FirebaseFirestore.instance;
  List data = [] ;
  var selectedCategory ;
  var selectedItem ;
  int itemIndex = 0;
  int categoryIndex = 0;
  Future<void> loadDB() async {
     await db.collection("categories").get().then((event) {
      for (var doc in event.docs) {
        data.add(doc);
      }
    });
    print("done");
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
}
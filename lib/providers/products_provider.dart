import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider extends ChangeNotifier{
  var db = FirebaseFirestore.instance;
  List data = [] ;
  var selectedCategory ;
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
    selectedCategory = data[index];
    notifyListeners();
  }
}
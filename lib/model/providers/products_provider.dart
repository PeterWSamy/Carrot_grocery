import 'package:carrot/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class ProductsProvider extends ChangeNotifier {
  var db = FirebaseFirestore.instance;

  //Hive database
  final products = Hive.box("carts");
  List data = [];

  //to save the product being selected
  List cartItemsSaved = [];

  //for saving count of the data
  Map<String, dynamic> items = {};

  // ignore: prefer_typing_uninitialized_variables
  var selectedCategory;

  // ignore: prefer_typing_uninitialized_variables
  var selectedItem;
  int itemIndex = 0;
  int categoryIndex = 0;

// load the store items in the data[]
  Future<void> loadDB() async {
    await db.collection("categories").get().then((event) {
      for (var doc in event.docs) {
        data.add(doc);
      }
    });
    notifyListeners();
  }

  //selects the index of the category to display its items
  void selectCategory(int index) {
    categoryIndex = index;
    selectedCategory = data[index];
    notifyListeners();
  }

  //selects the index of the item in the category to display it
  void selectItem(int index) {
    itemIndex = index;
    selectedItem = selectedCategory['items'][index];
    notifyListeners();
  }

  void addItem() {
    var newItem = selectedItem;
    Product item = Product(
        description: newItem['description'],
        id: newItem['id'],
        name: newItem['name'],
        weight: newItem['weight'],
        price: newItem['price'],
        image: newItem['image']);
    item.increment();
    items[selectedItem['name']] = 1;
    cartItemsSaved.add(item);
    products.add(item);
    notifyListeners();
  }

  void increaseQuantity() {
    Product item;
    for (var index =0; index <products.length; index  ++) {
      if (products.getAt(index ).name == selectedItem['name']) {
        item = products.getAt(index );
        item.increment();
        items[item.name] = item.quantity;
        products.putAt(index ,item);
      }
    }
    
    notifyListeners();
  }

  void decreaseQuantity() {
    Product item;
    for (var index =0; index <products.length; index  ++) {
      if (products.getAt(index ).name == selectedItem['name']) {
        item = products.getAt(index );
        item.decrement();
        items[item.name] = item.quantity;
        products.putAt(index , item);
        if (item.quantity <= 0) {
          cartItemsSaved.remove(item);
          items.remove(item.name);
          products.deleteAt(index );
        }
      }
    }

    notifyListeners();
  }

  void initialAdd() {
    cartItemsSaved = [];
    for (int i = 0; i < products.length; i++) {
      var item = products.getAt(i);
      cartItemsSaved.add(item);
      items[item.name] = item.quantity;
    }
  }

  void deleteDataBase() {
    for (int i = 0; i < products.length; i++) {
      items.remove(products.getAt(i).name);
      products.deleteAt(i);
    }
    cartItemsSaved = [];
    items = {};
    notifyListeners();
  }

  void deleteFormDB(int index){
    cartItemsSaved.remove(products.getAt(index));
    products.deleteAt(index);
    notifyListeners();
  }
}

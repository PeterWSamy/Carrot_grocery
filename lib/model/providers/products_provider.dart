import 'package:carrot/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class ProductsProvider extends ChangeNotifier {
  var db = FirebaseFirestore.instance;

  //Hive database
  final contactsBox = Hive.box('carts');

  List data = [];

  //to save the product being selected
  List cartItems = [];

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
    selectedItem = selectedCategory["items"][index];
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
    cartItems.add(item);
    notifyListeners();
  }

  void increaseQuantity(){
    Product item = cartItems.where((element) => element.name == selectedItem.name) as Product;
    item.increment();
    items[item.name] = item.quantity;
    notifyListeners();
  }

  void decreaseQuantity(){
    Product item = cartItems.where((element) => element.name == selectedItem.name) as Product;
    item.decrement();
    items[item.name] = item.quantity;
    if(item.quantity <= 0){
      cartItems.remove(item);
      items.remove(item.name);
    }
    notifyListeners();
  }

  void addToDatabase(){
    for (var cartItem in cartItems){
      contactsBox.add(cartItem);
      cartItems.remove(cartItem);
    }
  }

  int currentCount() {
    if(selectedItem != null){
      return items[selectedItem['name']] ?? 0;
    }
    return 0;
  } 
}

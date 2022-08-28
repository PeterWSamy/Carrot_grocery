import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId:0)
class Product {
  
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String weight;
  @HiveField(3)
  double price;
  @HiveField(4)
  String image;
  @HiveField(5)
  String description;
  @HiveField(6)
  int quantity = 0;


  Product(
      {required this.id,
      required this.name,
      required this.weight,
      required this.price,
      required this.image,
      required this.description});
  void increment(){
    quantity++;
  }

  void decrement(){
    quantity--;
  }
  
  void setQuantity(int value){
    quantity = value;
  }
}

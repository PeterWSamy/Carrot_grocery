class Product {
  Product(
      {required this.id,
      required this.name,
      required this.weight,
      required this.price,
      required this.image,
      required this.description});
  int id;
  String name;
  String weight;
  double price;
  String image;
  String description;
  int quantity = 0;

  
}

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

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        weight = json['weight'],
        price = json['price'],
        image = json['image'],
        description = json['description'];
  
  Map<String, dynamic> toJson() => {
    'id' : id,
    'name':name,
    'weight': weight,
    'price': price,
    'image': image,
    'description': description
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.disc,
    this.image,
    this.price,
    this.isFav,
    this.weight,
    this.color,
  });

  int? id;
  String? name;
  String? disc;
  String? image;
  double? price;
  bool? isFav;
  String? weight;
  int? color;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        disc: json["disc"],
        image: json["image"],
        price: json["price"],
        isFav: json["isFav"],
        weight: json["weight"],
        color: json["color"],
      );
}

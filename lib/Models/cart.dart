class Cart {
  Cart({
    this.id,
    this.name,
    this.image,
    this.price,
    this.weight,
    this.quantity,
    this.color,
  });

  int? id;
  String? name;
  String? image;
  double? price;
  String? weight;
  int? quantity;
  int? color;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        weight: json["weight"],
        quantity: json["quantity"],
        color: json["color"],
      );
}

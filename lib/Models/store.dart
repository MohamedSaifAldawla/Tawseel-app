class Store {
  Store({
    this.id,
    this.image,
    this.name,
  });

  String? id;
  String? image;
  String? name;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        image: json["image"],
        name: json["name"],
      );
}

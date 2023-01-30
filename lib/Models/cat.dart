class Categories {
  Categories({
    this.id,
    this.image,
    this.title,
    this.color,
  });

  String? id;
  String? image;
  String? title;
  String? color;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        color: json["color"],
      );
}

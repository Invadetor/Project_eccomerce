import 'dart:ui';


class Product {
  String? image, title, description, subtitle, category;
  int? price, size, id, quantita, inCart;
  List<Color>? colors;

  Product.fromJson (jsonMap) {
    id = jsonMap["id"] as int;
    quantita = jsonMap["quantita"] as int;
    inCart = jsonMap["inCart"] as int;
    title = jsonMap["title"];
    subtitle = jsonMap["subtitle"];
    size = jsonMap["size"] as int;
    image = jsonMap["image"];
    price = jsonMap["price"] as int;
    description = jsonMap["description"];
    category = jsonMap["categoria"];
    List<dynamic> ls = jsonMap["colors"];
    colors = List<Color>.from(ls.map((e) => Color(int.parse(e.toString().replaceAll("0xFF", ""), radix: 16))));
  }

  Product({
    this.id,
    this.quantita,
    this.image,
    this.title,
    this.subtitle,
    this.category,
    this.inCart,
    this.price,
    this.description,
    this.size,
    this.colors,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map["title"] = title;
    map["id"] = id;
    map["quantita"] = quantita;
    map["image"] = image;
    map["subtitle"] = subtitle;
    map["categoria"] = category;
    map["price"] = price;
    map["inCart"] = inCart;
    map["description"] = description;
    map["size"] = size;
    map["colors"] = colors?.map((e) => e.value).toList();
    return map;
  }
}
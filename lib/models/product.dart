import 'dart:ui';

class Product {
  final String? image, title, description, subtitle;
  final int? price, size, id;
  final List<Color>? colors;

  Product({
    this.id,
    this.image,
    this.title,
    this.subtitle,
    this.price,
    this.description,
    this.size,
    this.colors,
  });

}

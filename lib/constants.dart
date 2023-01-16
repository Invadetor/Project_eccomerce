import 'package:flutter/material.dart';

import 'models/product.dart';

class Constants {
  static const textDarkColor = Color(0xFF535353);
  static const textLightColor = Color(0xFFACACAC);
  static const defaultPadding = 20.0;

  static String dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
      "Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

  static List<String> categories = ["Handbag", "Jewellery", "Footwear", "Dresses", "Skirts", "Pants", "Shirts", "Accessories"];

  static List<Product> products = [
    Product(
        id: 1,
        title: "Office Code",
        subtitle: "Aristocratic Hand Bag",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/bag_1.png",
        colors: [Color(0xFF3D82AE), Color(0xFFE6B398), Color(0xFFFB7883)]),
    Product(
        id: 2,
        title: "Belt Bag",
        subtitle: "Aristocratic Hand Bag",
        price: 234,
        size: 8,
        description: dummyText,
        image: "assets/images/bag_2.png",
        colors: [Color(0xFFD3A984), Color(0xFF3D82AE), Color(0xFFE6B398)]),
    Product(
        id: 3,
        title: "Hang Top",
        subtitle: "Aristocratic Hand Bag",
        price: 234,
        size: 10,
        description: dummyText,
        image: "assets/images/bag_3.png",
        colors: [Color(0xFF989493), Color(0xFF3D82AE), Color(0xFFD3A984)]),
    Product(
        id: 4,
        title: "Old Fashion",
        subtitle: "Aristocratic Hand Bag",
        price: 234,
        size: 11,
        description: dummyText,
        image: "assets/images/bag_4.png",
        colors: [Color(0xFFE6B398), Color(0xFF989493), Color(0xFF3D82AE)]),
    Product(
        id: 5,
        title: "Office Code",
        subtitle: "Aristocratic Hand Bag",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/bag_5.png",
        colors: [Color(0xFFFB7883), Color(0xFFE6B398), Color(0xFFAEAEAE)]),
    Product(
      id: 6,
      title: "Office Code",
      subtitle: "Aristocratic Hand Bag",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_6.png",
      colors: [Color(0xFFAEAEAE), Color(0xFFFB7883), Color(0xFF3D82AE)],
    ),
  ];
}
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import '../models/product.dart';

class ProductDAO {

  static DatabaseReference database = FirebaseDatabase.instance.ref("Negozio/prodotti");

  //TODO: Convertire una Stringa in un reale numero esadecimale

  Future<Product> readOneProduct(int id, String category) async {
    DataSnapshot ds = await database.get();
    if(ds.exists) {
      List<Product> products = await getProductOfCategory(category);
      return List.from(products.where((element) => element.id == id)).first;
    } else {
      throw Exception("Errore");
    }
  }

  static Future<List<Product>> getProductOfCategory(String category) async {
    DataSnapshot ds = await database.get();
    if(ds.exists) {
      var list = ds.value! as List<dynamic>;
      List<Product> products = List<Product>.from(list.map((e) => Product.fromJson(e)));
      return List.from(products.where((element) => element.category == category));
    } else {
      throw Exception("errore");
    }
  }
}
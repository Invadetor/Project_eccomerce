import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:progetto_ecommerce/models/product.dart';

class Cart extends ChangeNotifier {

  final Map<Product, int> _products = {};
  DatabaseReference database = FirebaseDatabase.instance.ref("Negozio/cart");

  void getAllProducts () async {
    DataSnapshot ds = await database.get();
    if(ds.exists) {
      var list = ds.value! as List<dynamic>;
      List<Product> productList = List<Product>.from(list.map((e) => Product.fromJson(e)));
      productList.forEach((element) {_products[element] = element.quantita!;});
      notifyListeners();
    } else {
      throw Exception("errore");
    }
  }

  void addToDatabaseCart(Product p, int i) {
    Map<String, dynamic> map = <String, dynamic>{};
    map = p.toJson();
    map["quantita"] = i;
    database.child(p.id.toString()).update(map);
  }

  void addProduct (Product p, int i) {
    if(_products[p] == null) {
      _products[p] = i;
      addToDatabaseCart(p, i);
    } else {
      updateCounter(p, i);
      updateDatabaseObject(p, i);
    }
    notifyListeners();
  }

  void updateDatabaseObject(Product p, int i) async {
    Map<String, dynamic> map = <String, dynamic>{};
    map = p.toJson();
    DataSnapshot ds = await database.child(p.id.toString()).get();
    if(ds.exists) {
      var value = ds.value as dynamic;
      map["quantita"] = value["quantita"] + i;
      database.child(p.id.toString()).update(map);
    }
  }

  void updateCounter (Product p, int i) {
    _products.update(p, (value) => i + value);
  }

  void reduceDatabaseObjectCounter(Product p) async {
    Map<String, dynamic> map = <String, dynamic>{};
    map = p.toJson();
    DataSnapshot ds = await database.child(p.id.toString()).get();
    if(ds.exists) {
      var value = ds.value as dynamic;
      map["quantita"] = value["quantita"] - 1;
      database.child(p.id.toString()).update(map);
    }
  }

  void removeFromCounter(Product p) {
    products?.update(p, (value) => value - 1);
    reduceDatabaseObjectCounter(p);
    notifyListeners();
  }

  void removeDatabaseObject(Product p) {
    database.child(p.id.toString()).remove();
  }

  void removeProduct (Product p) {
    _products.remove(p);
    removeDatabaseObject(p);
    notifyListeners();
  }

  //void removeOneValue (Product p, int i) {
  //  _products[p] = i - 1;
  //  notifyListeners();
  //}

  void removeAll () {
    _products.clear();
    notifyListeners();
  }

  Map<Product, int>? get products => _products;

}
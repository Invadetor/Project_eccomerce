import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:progetto_ecommerce/models/product.dart';

class Cart extends ChangeNotifier {

  Map<int, Product> _products = {};
  DatabaseReference databaseCart = FirebaseDatabase.instance.ref("Negozio/cart");

  void set products(Map<int, Product> p) {
    _products = p;
  }

  Future<Map<int, Product>> getAllProductsInCart () async {
    DataSnapshot ds = await databaseCart.get();
    if(ds.exists) {
      var list = ds.value! as List<dynamic>;
      List<Product> productList = List<Product>.from(list.map((e) {
        if(e != null) {
          return Product.fromJson(e);
        }
      }));
      for (var element in productList) {_products[element.id??0] = element;}
      return _products;
    } else {
      return _products;
    }
  }



  double get totale {
    double newTotale = 0;
    products.forEach((key, value) {newTotale += value.price! * value.inCart!;});
    return newTotale;
  }

  Map<int, Product> get products {return _products;}

  void addProduct (Product p, int i) async {
    products = await getAllProductsInCart();
    if(products[p.id??0] == null) {
      products[p.id??0] = p;
      products[p.id??0]?.inCart = i;
    } else {
      updateCounter(p, i);
    }
    updateDatabaseProducts();
    notifyListeners();
  }

  void updateDatabaseProducts() {
    Map<String, dynamic> mps = {};
    for(int i = 0; i < _products.length; i++) {
      mps[i.toString()] = _products.values.elementAt(i).toJson();
    }
    databaseCart.set(mps);
  }

  void updateCounter (Product p, int i) {
    p.inCart = (p.inCart! + i);
    products.update(p.id??0, (value) => p);
  }

  void reduceCounter(Product p) {
    p.inCart = (p.inCart! - 1);
    products.update(p.id??0, (value) => p);
    if(products[p.id??0]?.inCart == 0) {
      removeProduct(p);
    } else {
      updateDatabaseProducts();
    }
    notifyListeners();
  }

  void removeProduct (Product p) {
    _products.remove(p.id??0);
    updateDatabaseProducts();
    notifyListeners();
  }

}
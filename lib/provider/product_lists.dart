import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductList extends ChangeNotifier {

  DatabaseReference databaseProd = FirebaseDatabase.instance.ref("Negozio/prodotti");
  List<Product> _products = <Product>[];

  Future<List<Product>> getAllProducts() async {
    DataSnapshot ds = await databaseProd.get();
    if(ds.exists) {
      var list = ds.value! as List<dynamic>;
      _products = List<Product>.from(list.map((e) {
        if(e != null) {
          return Product.fromJson(e);
        }
      }
      ));
      notifyListeners();
      return _products;
    } else {
      throw Exception("error");
    }
  }

  List<Product> getProductsOfCategory(String category) {
    switch (category) {
      case "uomo/pantaloni": {
        return pantaloni;
      }
      case "uomo/orologi": {
        return orologi;
      }
      case "donna/borse": {
        return borse;
      }
      case "donna/gonne": {
        return gonne;
      }
      case "bambino/pigiami": {
        return pigiami;
      }
      case "bambino/tute": {
        return tute;
      }
    }
    throw Exception("categoria inesistente");
  }
  
  List<Product> get pantaloni {
    return _products.where((element) => element.category == "uomo/pantaloni").toList();
  }

  List<Product> get orologi {
    return _products.where((element) => element.category == "uomo/orologi").toList();
  }

  List<Product> get borse {
    return _products.where((element) => element.category == "donna/borse").toList();
  }

  List<Product> get gonne {
    return _products.where((element) => element.category == "donna/gonne").toList();
  }

  List<Product> get pigiami {
    return _products.where((element) => element.category == "bambino/pigiami").toList();
  }

  List<Product> get tute {
    return _products.where((element) => element.category == "bambino/tute").toList();
  }
}
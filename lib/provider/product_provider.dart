import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider({this.products});

  List<Product>? products;
  DatabaseReference database = FirebaseDatabase.instance.ref("Negozio/prodotti");

  void getAllProducts () async {
    DataSnapshot ds = await database.get();
    if(ds.exists) {
      var list = ds.value! as List<dynamic>;
      products = List<Product>.from(list.map((e) => Product.fromJson(e)));
      notifyListeners();
    } else {
      throw Exception("errore");
    }
  }

}
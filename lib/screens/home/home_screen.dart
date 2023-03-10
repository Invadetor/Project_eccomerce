import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/DAO/product_dao.dart';
import 'package:progetto_ecommerce/constants.dart';
import 'package:progetto_ecommerce/myappbar.dart';
import 'package:progetto_ecommerce/screens/home/components/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDAO pd = ProductDAO();
    pd.readOneProduct(1, "uomo/pantaloni");
    pd.getProductOfCategory("uomo/pantaloni");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(),
      body: Body(),
    );
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/DAO/product_dao.dart';
import 'package:progetto_ecommerce/helpers/constants.dart';
import 'package:progetto_ecommerce/helpers/myappbar.dart';
import 'package:progetto_ecommerce/screens/home/components/body.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.tipo});

  int tipo = 0;
  int subCategory = 0;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(),
      body: Body(tipo: widget.tipo),
    );
  }
}

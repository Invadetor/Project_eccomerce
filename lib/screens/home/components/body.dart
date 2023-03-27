import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/screens/home/components/categories.dart';
import 'package:progetto_ecommerce/screens/home/components/product_card.dart';
import 'package:provider/provider.dart';

import '../../../DAO/product_dao.dart';
import '../../../helpers/constants.dart';
import '../../../provider/appstate.dart';
import '../../../provider/product_lists.dart';
import '../../details/details.dart';

class Body extends StatelessWidget {
  Body({super.key, required this.tipo});

  int tipo = 0;
  List<String> tipoNome = ["donna", "uomo", "bambino"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Constants.defaultPadding),
          child: Text(tipoNome[tipo], style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
        ),
        Categories(tipo: tipo),
        Consumer<AppState>(
          builder: (context, appState, _) {
            return FutureBuilder(
                future: ProductDAO.getProductOfCategory("${tipoNome[tipo]}/${Constants.categories[tipo]![appState.selectedCategory]}"),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done) {
                    return buildHomePage(context);
                  }
                  return const Center(child: CircularProgressIndicator());
                }
            );
          }
        )
      ],
    );
  }

  Widget buildHomePage(BuildContext context) {
    Provider.of<ProductList>(context).getAllProducts();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(Constants.defaultPadding),
        child: Consumer<ProductList>(
          builder: (context, productList, child) {
            return GridView.builder(
              shrinkWrap: true,
              itemCount: productList.getProductsOfCategory("${tipoNome[tipo]}/${Constants.categories[tipo]?.elementAt(Provider.of<AppState>(context).selectedCategory)}").length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: max(2, (MediaQuery.of(context).size.width!/200).floor()),
                mainAxisSpacing: Constants.defaultPadding,
                crossAxisSpacing: Constants.defaultPadding,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (context, i) {
                return ProductCard(p: productList.getProductsOfCategory("${tipoNome[tipo]}/${Constants.categories[tipo]?.elementAt(Provider.of<AppState>(context).selectedCategory)}").elementAt(i),
                    onPress: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Details(p: productList.getProductsOfCategory("${tipoNome[tipo]}/${Constants.categories[tipo]?.elementAt(Provider.of<AppState>(context).selectedCategory)}").elementAt(i))
                    ))
                );
              },
            );
          }
        ),
      ),
    );
  }

  
}
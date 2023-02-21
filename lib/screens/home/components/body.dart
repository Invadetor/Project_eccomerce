import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/screens/home/components/categories.dart';
import 'package:progetto_ecommerce/screens/home/components/product_card.dart';

import '../../../constants.dart';
import '../../details/details.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Constants.defaultPadding),
          child: Text("Woman", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(Constants.defaultPadding),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: Constants.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: max(2, (MediaQuery.of(context).size.width!/200).floor()),
                mainAxisSpacing: Constants.defaultPadding,
                crossAxisSpacing: Constants.defaultPadding,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (context, i) {
                return ProductCard(p: Constants.products[i],
                onPress: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Details(p: Constants.products[i])
                 ))
                );
              },
            ),
          ),
        )
      ],
    );
  }

}
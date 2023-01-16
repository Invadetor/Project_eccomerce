import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/screens/details/components/color&size.dart';
import 'package:progetto_ecommerce/screens/details/components/product_name&image.dart';

import '../../../models/product.dart';

class Body extends StatelessWidget {
  const Body({super.key, this.p});

  final Product? p;

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              height: sizeOfScreen.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: sizeOfScreen.height*0.4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
                    ),
                    child: Column(
                      children: [
                        ColorAndSize(p: p)
                      ],
                    ),
                  ),
                  ProductNameImage(p: p)
                ],
              )
          )
        ],
      ),

    );
  }

}
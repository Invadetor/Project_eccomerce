import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/product.dart';

class ProductNameImage extends StatelessWidget {
  ProductNameImage({super.key, @required this.p});

  Product? p;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${p?.subtitle}",
            style: TextStyle(color: Colors.white)
          ),
          Text("${p?.title}",
            style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white)
          ),
          const SizedBox(height: Constants.defaultPadding),
          Row(
            children: [
              RichText(
                  text: TextSpan(
                      children: [
                        const TextSpan(text: "price\n", style: TextStyle(color: Colors.white)),
                        TextSpan(text: "${p?.price}€",
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white)
                        ),
                      ]
                  )
              ),
              SizedBox(width: Constants.defaultPadding),
              Expanded(child: Hero(
                child: Image.asset(p?.image??" ", fit: BoxFit.contain),
                tag: "${p?.id}"
              ))
            ],
          )

        ],
      ),
    );
  }

}
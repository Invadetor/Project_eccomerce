import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/product.dart';

class ProductCard extends StatelessWidget {

  final Product? p;
  final VoidCallback? onPress;

  ProductCard({super.key, this.p, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
                padding: const EdgeInsets.all(Constants.defaultPadding),
                decoration: BoxDecoration(color: p?.colors?.first, borderRadius: BorderRadius.circular(10)),
                child: Hero(tag: "${p?.id}", child: Image.asset(p?.image??" ", fit: BoxFit.fill)),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(p?.title??" ", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Constants.textLightColor, fontSize: 18)),
          ),
          Text("${p?.price.toString()}€"??" ", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 20))
        ],
      ),
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/constants.dart';

import '../../../models/product.dart';
import 'circle.dart';

class ColorAndSize extends StatefulWidget{
  ColorAndSize({super.key, required this.p});

  Product? p;

  @override
  State<StatefulWidget> createState() => _StateColorAndSize();

}

class _StateColorAndSize extends State<ColorAndSize>{

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Expanded(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Color", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18)),
               const SizedBox(height: 10),
               ColorSelector(colors: widget.p?.colors)
             ],
            ),
         ),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                     "Size",
                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18)
                 ),
                 SizedBox(height: 10),
                 Text(
                     widget.p?.size.toString() ?? "",
                     style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold, fontSize: 28)
                 )
               ]
           )
         )
      ],
    );
  }
}

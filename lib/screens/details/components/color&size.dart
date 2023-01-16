import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      children: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Color"),
             ColorSelector(colors: widget.p?.colors)
           ],
          )
      ],
    );
  }
}

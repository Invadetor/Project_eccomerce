import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../myappbar.dart';
import 'components/body.dart';

class Details extends StatelessWidget {
  const Details({super.key, this.p});

  final Product? p;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: p?.colors?.first,
      appBar: MyAppbar(c: p?.colors?.first),
      body: Body(p: p),
    );
  }
}
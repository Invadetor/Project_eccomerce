import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/myappbar.dart';

import 'body.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppbar(
          showBack: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Vestiti",
              style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )
      ),
      body: const Body()
    );
  }

}
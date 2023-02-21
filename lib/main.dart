import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/firebase_options.dart';
import 'package:progetto_ecommerce/screens/home/home_screen.dart';
import 'package:progetto_ecommerce/screens/mainPage/mainPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'DAO/product_dao.dart';
import 'constants.dart';
import 'provider/cart.dart';
import 'package:provider/provider.dart';

void main() {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp()
    )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Constants.textDarkColor)
      ),
      home: MainPage(),
    );
  }
}
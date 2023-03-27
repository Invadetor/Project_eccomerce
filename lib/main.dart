import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:progetto_ecommerce/helpers/firebase_options.dart';
import 'package:progetto_ecommerce/provider/appstate.dart';
import 'package:progetto_ecommerce/provider/product_lists.dart';
import 'package:progetto_ecommerce/screens/home/home_screen.dart';
import 'package:progetto_ecommerce/screens/mainPage/mainPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'DAO/product_dao.dart';
import 'helpers/constants.dart';
import 'provider/cart.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<Cart>(create: (_) => Cart()),
          ChangeNotifierProvider<AppState>(create: (_) => AppState()),
          ChangeNotifierProvider<ProductList>(create: (_) => ProductList())
        ],
        child: const MyApp(),
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
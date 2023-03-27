import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/screens/cartView/cartView.dart';

import 'constants.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget{
  MyAppbar({super.key, this.c, this.showCart = true, this.showBack = true, this.title});

  Color? c;
  bool showCart;
  bool showBack;
  Widget? title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: AppBar(
        title: title,
        backgroundColor: c ?? Colors.white,
        elevation: 0,
        leading: showBack ? Padding(
          padding: const EdgeInsets.only(top: 15),
          child: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: Icon(Icons.arrow_back, color: c == null ? Constants.textDarkColor : Colors.white, size:35),
          ),
        ) : null,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: IconButton(
              onPressed: () {  },
              icon: Icon(Icons.search, color: c == null ? Constants.textDarkColor : Colors.white, size:35),
            ),
          ),
          if (showCart)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: IconButton(
              onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartView()));},
              icon: Icon(Icons.shopping_cart, color: c == null ? Constants.textDarkColor : Colors.white, size:35),
            ),
          ),
          const SizedBox(
            width: Constants.defaultPadding,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

}
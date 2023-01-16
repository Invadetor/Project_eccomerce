import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget{
  MyAppbar({super.key, this.c});

  Color? c;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: c ?? Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () { Navigator.pop(context);},
        icon: Icon(Icons.arrow_back, color: c == null ? Constants.textDarkColor : Colors.white ),
      ),
      actions: [
        IconButton(
          onPressed: () {  },
          icon: Icon(Icons.search, color: c == null ? Constants.textDarkColor : Colors.white ),
        ),
        IconButton(
          onPressed: () {  },
          icon: Icon(Icons.shopping_cart, color: c == null ? Constants.textDarkColor : Colors.white ),
        ),
        const SizedBox(
          width: Constants.defaultPadding,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

}
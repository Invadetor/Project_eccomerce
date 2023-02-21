import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Categories extends StatefulWidget {
  Categories({super.key});

  @override
  State<StatefulWidget> createState() => _CategoriesState();

}

class _CategoriesState extends State<Categories> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Constants.WomanCat.length,
        itemBuilder: buildList,
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return GestureDetector(
      onTap: (){setState(() {selectedIndex = index;});},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Text(Constants.WomanCat[index], style: TextStyle(fontWeight: FontWeight.bold, color: index == selectedIndex? Constants.textDarkColor : Constants.textLightColor)),
            Container(width: 30, height: 2, color: index == selectedIndex? Constants.textDarkColor : Colors.transparent)
          ],
        ),
      ),
    );
  }

}
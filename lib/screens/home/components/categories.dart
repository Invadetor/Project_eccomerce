import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants.dart';
import '../../../provider/appstate.dart';

class Categories extends StatefulWidget {
  Categories({super.key, required this.tipo});

  int tipo = 0;

  @override
  State<StatefulWidget> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Constants.categories[widget.tipo]?.length,
        itemBuilder: buildList,
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return GestureDetector(
          onTap: (){appState.selectedCategory = index;},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Text(Constants.categories[widget.tipo]![index], style: TextStyle(fontWeight: FontWeight.bold, color: index == appState.selectedCategory? Constants.textDarkColor : Constants.textLightColor)),
                Container(width: 30, height: 2, color: index == appState.selectedCategory? Constants.textDarkColor : Colors.transparent)
              ],
            ),
          ),
        );
      },

    );
  }

}
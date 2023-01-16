import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Circle extends StatelessWidget {
  Circle({super.key, required this.selected, required this.c});

  Color c;

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(100),
      width: 10,
      decoration: BoxDecoration(shape: BoxShape.circle, color: c, border: Border.all(color: selected ? Colors.blueGrey : Colors.transparent)),
    );
  }
}

class ColorSelector extends StatefulWidget {
  ColorSelector({super.key, required this.colors});

  List<Color>? colors;

  @override
  State<StatefulWidget> createState() => _StateColorSelector();
}

class _StateColorSelector extends State<ColorSelector> {

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(widget.colors != null)
          for (int i = 0; i < widget.colors!.length; i++)
            GestureDetector(child: Circle(c: Colors.black, selected: selectedIndex == i), onTap: (){
              setState(() {
              selectedIndex = i;
              });},)
      ],
    );
  }

}
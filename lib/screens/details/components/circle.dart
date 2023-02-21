import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Circle extends StatelessWidget {
  Circle({super.key, required this.selected, required this.c});

  Color c;

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(shape: BoxShape.circle, color: c, border: Border.all(color: selected ? Colors.black : Colors.transparent, width: 2)),
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
            GestureDetector(child: Circle(c: widget.colors?[i] ?? Colors.black, selected: selectedIndex == i), onTap: (){
              setState((){selectedIndex = i;});
              },
            )
      ],
    );
  }

}
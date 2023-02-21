import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWithFavBtn extends StatefulWidget {
  CounterWithFavBtn({super.key, this.onPressRight, this.onPressLeft, required this.counter});

  VoidCallback? onPressRight;
  VoidCallback? onPressLeft;
  int counter = 1;

  @override
  State<StatefulWidget> createState() => _CounterWithFavBtnState();
}

class _CounterWithFavBtnState extends State<CounterWithFavBtn> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            button(icon: Icons.remove, onPress: widget.onPressLeft),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("${widget.counter}".padLeft(2, "0"), style: Theme.of(context).textTheme.headline6),
            ),
            button(icon: Icons.add, onPress: widget.onPressRight),
          ],
        ),
        favButton()
      ],
    );
  }

  Widget favButton() {
    return GestureDetector(
      onTap: (){setState(() {isFav = !isFav;});},
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Icon(!isFav ? Icons.favorite_outline : Icons.favorite, color: Colors.white),
      ),
    );
  }

  Widget button ({IconData? icon, VoidCallback? onPress}) {
    return SizedBox(
        width: 40,
        height: 32,
        child: OutlinedButton(
            onPressed: onPress,
            style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            ),
            child: Center(child: Icon(icon))
        )
    );
  }

}
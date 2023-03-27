import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/helpers/constants.dart';
import 'package:progetto_ecommerce/screens/details/components/color&size.dart';
import 'package:progetto_ecommerce/screens/details/components/product_name&image.dart';
import 'package:provider/provider.dart';

import '../../../provider/cart.dart';
import '../../../models/product.dart';
import 'counter_with_fav_btn.dart';

class Body extends StatefulWidget {
  Body({super.key, this.p});

  final Product? p;
  int counter = 1;

  @override
  State<StatefulWidget> createState() => _Body();

}

class _Body extends State<Body> {

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              height: sizeOfScreen.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: sizeOfScreen.height*0.4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: Constants.defaultPadding, right: Constants.defaultPadding, top: Constants.defaultPadding*2),
                      child: Column(
                        children: [
                          ColorAndSize(p: widget.p),

                          const SizedBox(height: Constants.defaultPadding),
                          Text(widget.p?.description ?? "", style: Theme.of(context).textTheme.caption?.copyWith(height: 1.5, fontSize: 16)),

                          const SizedBox(height: Constants.defaultPadding),
                          CounterWithFavBtn(counter: widget.counter,
                              onPressRight: () {setState(() {widget.counter++;});},
                              onPressLeft: () {setState(() {widget.counter--;});}
                          ),

                          const SizedBox(height: Constants.defaultPadding),
                          buildCart()
                        ],
                      ),
                    ),
                  ),
                  ProductNameImage(p: widget.p)
                ],
              )
          )
        ],
      ),

    );
  }

  Widget buildCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){Provider.of<Cart>(context, listen: false).addProduct(widget.p??Product(), widget.counter);},
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: widget.p?.colors?.first ?? Colors.black, width: 2)
            ),
            child: Icon(Icons.add_shopping_cart, color: widget.p?.colors?.first ?? Colors.black, size: 30),
          ),
        ),
        GestureDetector(
          onTap: (){},
          child: Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: widget.p?.colors?.first ?? Colors.black
            ),
            child: const Center(
              child: Text("BUY NOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ),
        )
      ],
    );
  }

}
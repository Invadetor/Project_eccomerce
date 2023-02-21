import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/myappbar.dart';
import 'package:provider/provider.dart';

import '../../provider/cart.dart';
import '../../models/product.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<StatefulWidget> createState() => _CartView();
}


class _CartView extends State<CartView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(showCart: false, title: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text("Il tuo carrello", style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
      )),
      body: Consumer<Cart> (
        builder: (context, cart, child) {
          if(cart.products == null) {
            return Center(
                child: Text("Errore, nessun carrello", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold, fontSize: 40),)
            );
          }
          return cart.products!.isNotEmpty ? ListView.separated(
            itemCount: cart.products?.length??0,
            separatorBuilder: (context, index) {return const Divider();},
            itemBuilder: (context, index) => ListTile(
              visualDensity: const VisualDensity(vertical: 4),
              leading: Image.asset(cart.products?.keys.elementAt(index).image??"", fit: BoxFit.contain, ),
              title: Text(cart.products?.keys.elementAt(index).title??"", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
              trailing: SizedBox(
                width: 150,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("${cart.products?.values.elementAt(index)} x", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                    GestureDetector(
                      onLongPress: (){
                        if(cart.products?[cart.products?.keys.elementAt(index)] != null) {
                          setState(() {
                            cart.removeProduct(cart.products!.keys.elementAt(index));
                          });
                        }
                      },
                      onTap: (){
                        if(cart.products?[cart.products?.keys.elementAt(index)] != null) {
                          if(cart.products?.values.elementAt(index) == 1) {
                            setState(() {
                              cart.removeProduct(cart.products!.keys.elementAt(index));
                            });
                          } else {
                            setState(() {
                              cart.removeFromCounter(cart.products!.keys.elementAt(index));
                            });
                          }
                        }},
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.red, width: 2)
                        ),
                        child: const Icon(Icons.delete_outline, color: Colors.red, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ) : Center(
            child: Text("Il Tuo carrello è vuoto", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold, fontSize: 40),)
          );
        },
      ),
    );
  }

}
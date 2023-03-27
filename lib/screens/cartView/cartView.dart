import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:progetto_ecommerce/helpers/myappbar.dart';
import 'package:progetto_ecommerce/helpers/stripe_service.dart';
import 'package:provider/provider.dart';

import '../../provider/cart.dart';
import '../../models/product.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  StripeService ss = StripeService();

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
          return FutureBuilder(
            future: cart.getAllProductsInCart(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    Flexible(child: listCart(cart)),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${cart.totale}€", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold, fontSize: 40),),
                          const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                          GestureDetector(
                            onTap: (){widget.ss.makePayment(cart.totale, "EUR");},
                            child: Container(
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue
                              ),
                              child: const Center(
                                child: Text("BUY NOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }
          );
        },
      ),

    );
  }

  Widget listCart (Cart cart){
    return cart.products.isNotEmpty ? ListView.separated(
        itemCount: cart.products.length??0,
        separatorBuilder: (context, index) {return const Divider();},
        itemBuilder: (context, index) => ListTile(
          visualDensity: const VisualDensity(vertical: 4),
          leading: Image.asset(cart.products.values.elementAt(index).image??"", fit: BoxFit.contain, ),
          title: Text(cart.products.values.elementAt(index).title??"", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
          subtitle: Text("${cart.products.values.elementAt(index).price.toString()}€", style: Theme.of(context).textTheme.headline3?.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
          trailing: SizedBox(
            width: 150,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("${cart.products.values.elementAt(index).inCart} x", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
                ),
                GestureDetector(
                  onLongPress: (){
                    setState(() {
                      cart.removeProduct(cart.products.values.elementAt(index));
                    });
                  },
                  onTap: (){cart.reduceCounter(cart.products.values.elementAt(index));},
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
  }


}
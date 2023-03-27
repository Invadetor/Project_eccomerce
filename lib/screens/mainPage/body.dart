import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_ecommerce/screens/home/home_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),

          GestureDetector(
            onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(tipo: 0,)));},
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 210,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/women.jpg", fit: BoxFit.fill)),
            ),
          ),
          const SizedBox(height: 5),
          Text("Woman", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold, fontSize: 30)),
          const SizedBox(height: 40),

          GestureDetector(
            onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(tipo: 1,)));},
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 210,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/men.jpg", fit: BoxFit.fill)
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text("Man", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold, fontSize: 30)),
          const SizedBox(height: 40),

          GestureDetector(
            onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(tipo: 2,)));},
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 210,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/children.jpg", fit: BoxFit.fill)
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text("Children", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold, fontSize: 30)),
        ],
      ),
    );
  }

}
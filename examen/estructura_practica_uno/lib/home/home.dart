import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';

import '../cart/cart.dart';
import '../models/product_repository.dart';
import '../models/product_repository.dart';
import '../profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cart(
                    productsList: [],
                  ),
                ));
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          ItemHome(
            // TODO: Al hacer clic, que muestre un snackbar de "Proximamente"
            title: "Tazas",
            image: "https://i.imgur.com/fMjtSpy.png",
          ),
        ],
      ),
      drawer: Drawer(
        child: Profile(),
      ),
    );
  }

  void _openHotDrinksPage() {
    // TODO: completar en navigator pasando los parametros
    // a la pagina de HotDrinksPage

    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => HotDrinksPage(
              drinksList: ProductRepository.loadProducts(ProductType.BEBIDAS))),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => DessertsPage(
              dessertList:
                  ProductRepository.loadProducts(ProductType.POSTRES))),
    );
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => null),
    );
  }
}
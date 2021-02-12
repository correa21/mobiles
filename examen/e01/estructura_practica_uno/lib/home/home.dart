import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';

import '../cart/cart.dart';
import '../models/product_repository.dart';
import '../profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ProductCart cartList = new ProductCart(desserts: [], drinks: [], grains: []);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cart(
                    productsList: _generateItemsList(),
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
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.removeCurrentSnackBar();
              _scaffoldKey.currentState
                  .showSnackBar(SnackBar(content: Text('Proximamente!!!')));
            },
            child: ItemHome(
              title: "Tazas",
              image: "https://i.imgur.com/fMjtSpy.png",
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Profile(
          productsList: _generateItemsList(),
        ),
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => HotDrinksPage(
              drinksList: ProductRepository.loadProducts(ProductType.BEBIDAS)),
          settings: RouteSettings(arguments: cartList)),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => GrainsPage(
              grainsList: ProductRepository.loadProducts(ProductType.GRANO)),
          settings: RouteSettings(arguments: cartList)),
    );
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => DessertsPage(
              dessertList: ProductRepository.loadProducts(ProductType.POSTRES)),
          settings: RouteSettings(arguments: cartList)),
    );
  }

  List<ProductItemCart> _generateItemsList() {
    List<ProductItemCart> carrItems = new List<ProductItemCart>();
    int i = 0;
    if (null == cartList) {
    } else {
      if (cartList.desserts.isNotEmpty) {
        print('dentro de desserts');
        print(carrItems);
        print(cartList);
        for (ProductDesserts item in cartList.desserts) {
          carrItems.add(ProductItemCart(
              productTitle: item.productTitle,
              productAmount: item.productAmount,
              productPrice: item.productPrice,
              productImage: item.productImage,
              typeOfProduct: ProductType.POSTRES));
        }
      }
      if (cartList.drinks.isNotEmpty) {
        for (ProductHotDrinks item in cartList.drinks) {
          carrItems.add(ProductItemCart(
              productTitle: item.productTitle,
              productAmount: item.productAmount,
              productPrice: item.productPrice,
              productImage: item.productImage,
              typeOfProduct: ProductType.BEBIDAS));
        }
      }
      if (cartList.grains.isNotEmpty) {
        for (ProductGrains item in cartList.grains) {
          carrItems.add(ProductItemCart(
              productTitle: item.productTitle,
              productAmount: item.productAmount,
              productPrice: item.productPrice,
              productImage: item.productImage,
              typeOfProduct: ProductType.GRANO));
        }
      }
    }
    return carrItems;
  }
}

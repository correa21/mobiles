import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import 'item_hot_drinks_details.dart';

class HotDrinksPage extends StatelessWidget {
  final List<ProductHotDrinks> drinksList;

  HotDrinksPage({
    Key key,
    @required this.drinksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductCart cartList = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: ItemHotDrinks(
                drink: drinksList[index],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ItemHotDrinkDetail(drink: drinksList[index]),
                    settings: RouteSettings(
                      arguments: cartList,
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

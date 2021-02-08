import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import '../models/product_dessert.dart';
import '../models/product_grains.dart';
import 'item_desserts.dart';

class DessertsPage extends StatelessWidget {
  final List<ProductDesserts> dessertList;
  DessertsPage({
    Key key,
    @required this.dessertList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: dessertList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDesserts(
            dessert: dessertList[index],
          );
        },
      ),
    );
  }
}

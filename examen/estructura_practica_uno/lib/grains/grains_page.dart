import 'package:flutter/material.dart';

import '../models/product_grains.dart';
import 'item_grains.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> dessertList;
  GrainsPage({
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
          return ItemGrains(
            dessert: dessertList[index],
          );
        },
      ),
    );
  }
}

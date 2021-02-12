import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:flutter/material.dart';

import '../models/product_grains.dart';
import 'item_grains.dart';
import 'item_grains_details.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainsList;
  GrainsPage({
    Key key,
    @required this.grainsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductCart cartList = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Granos"),
      ),
      body: ListView.builder(
        itemCount: grainsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: ItemGrains(
                grain: grainsList[index],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ItemGrainsDetail(grains: grainsList[index]),
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

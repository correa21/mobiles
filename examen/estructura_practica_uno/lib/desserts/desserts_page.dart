import 'package:flutter/material.dart';

import '../models/product_dessert.dart';
import 'item_desserts.dart';
import 'item_desserts_details.dart';

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
          return GestureDetector(
              child: ItemDesserts(
                dessert: dessertList[index],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemdessertsDetail(),
                    settings: RouteSettings(
                      arguments: dessertList[index],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

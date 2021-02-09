import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

class ItemHotDrinkDetail extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinkDetail({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinkDetailState createState() => _ItemHotDrinkDetailState();
}

class _ItemHotDrinkDetailState extends State<ItemHotDrinkDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

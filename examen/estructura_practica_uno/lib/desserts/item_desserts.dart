import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import '../models/product_dessert.dart';

class ItemDesserts extends StatefulWidget {
  final ProductDesserts dessert;
  ItemDesserts({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertsState createState() => _ItemDessertsState();
}

class _ItemDessertsState extends State<ItemDesserts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Stack(
        children: [
          Positioned.fill(
            top: 16,
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(24.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.indigo,
              child: Container(height: 180),
            ),
          ),
          Container(
            height: 160,
            margin: EdgeInsets.only(top: 28, bottom: 24, left: 24, right: 24),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Café',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.yellow[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "${widget.dessert.productTitle}",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "\$${widget.dessert.productPrice}",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.620, 0.060),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Image.network(
                "${widget.dessert.productImage}",
                fit: BoxFit.contain,
                height: 150,
                width: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

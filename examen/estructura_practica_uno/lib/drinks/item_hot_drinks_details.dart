import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

class ItemHotDrinkDetail extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinkDetail({
    Key key,
    this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinkDetailState createState() => _ItemHotDrinkDetailState();
}

class _ItemHotDrinkDetailState extends State<ItemHotDrinkDetail> {
  bool _favorite = false;
  bool _chico = false;
  bool _mediano = true;
  bool _grande = false;

  @override
  Widget build(BuildContext context) {
    final ProductHotDrinks drink = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("NOMBRE DE LA BEBIDA"),
        ),
        body: Container(
            height: 900,
            child: Stack(children: [
              Positioned.fill(
                top: 0,
                child: Card(
                    elevation: 4.0,
                    margin: EdgeInsets.all(24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.indigo,
                    child: Image.network(
                      "${drink.productImage}",
                      alignment: Alignment.topLeft,
                      fit: BoxFit.contain,
                      height: 50,
                      width: 50,
                    ) //Container(height: 180),
                    ),
              ),
              Positioned(
                right: 30,
                top: 30,
                child: IconButton(
                    //fill icon depending of _favorite state
                    icon: drink.liked
                        ? Icon(
                            Icons.favorite,
                            color: Color(0xff214254),
                          )
                        : Icon(
                            Icons.favorite_border_outlined,
                            color: Color(0xff214254),
                          ),
                    iconSize: 30,
                    onPressed: () {
                      setState(() {
                        drink.liked = !drink.liked;
                        print(drink.liked);
                      });
                    }),
              ),
              Positioned.fill(
                top: 250,
                child: Container(
                  height: 160,
                  margin:
                      EdgeInsets.only(top: 28, bottom: 24, left: 24, right: 24),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          //here goes the product name
                          "${drink.productTitle}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          //here goes the product descripton
                          "${drink.productDescription}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15.0),
                          ChoiceChip(
                              label: Text(
                                'Chico',
                              ),
                              selected: _chico,
                              onSelected: (bool sel) {
                                setState(() {
                                  if (sel != _chico && true == sel) {
                                    drink.productSize = ProductSize.CH;
                                    _chico = sel;
                                    _mediano = !sel;
                                    _grande = !sel;
                                  }
                                });
                              }),
                          SizedBox(width: 15.0),
                          ChoiceChip(
                              label: Text(
                                'Mediano',
                              ),
                              selected: _mediano,
                              onSelected: (bool sel) {
                                setState(() {
                                  if (sel != _mediano && true == sel) {
                                    drink.productSize = ProductSize.M;
                                    _chico = !sel;
                                    _mediano = sel;
                                    _grande = !sel;
                                  }
                                });
                              }),
                          SizedBox(width: 15.0),
                          ChoiceChip(
                              label: Text(
                                'Grande',
                              ),
                              selected: _grande,
                              onSelected: (bool sel) {
                                setState(() {
                                  if (sel != _grande && true == sel) {
                                    drink.productSize = ProductSize.G;
                                    _chico = !sel;
                                    _mediano = !sel;
                                    _grande = sel;
                                  }
                                });
                              }),
                          SizedBox(width: 5.0),
                          Text(
                            "\$${drink.productPriceCalculator()}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      ButtonBar(buttonMinWidth: 159, children: <Widget>[
                        // ignore: deprecated_member_use
                        FlatButton(
                          child: Text('AGREGAR AL CARRITO'),
                          onPressed: () {
                            print("${drink.productSize}");
                          },
                          color: Colors.grey,
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          child: Text('COMPRAR AHORA'),
                          onPressed: () {},
                          color: Colors.grey,
                        )
                      ]),
                      Align(
                        alignment: Alignment.topRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                          // child: Image.network(
                          //   "image",
                          //   fit: BoxFit.contain,
                          //   height: 180,
                          //   width: 180,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}

import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

import '../pay_page.dart';

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
  bool _chico = false;
  bool _mediano = true;
  bool _grande = false;

  @override
  Widget build(BuildContext context) {
    final ProductCart cartList = ModalRoute.of(context).settings.arguments;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final snackBar =
        SnackBar(content: Text('Se a aniadido un producto a tu carrito'));
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("${widget.drink.productTitle}"),
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
                ),
              ),
              Align(
                alignment: Alignment(0.0, -0.88),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                  child: Image.network(
                    "${widget.drink.productImage}",
                    fit: BoxFit.contain,
                    height: 289,
                    width: 289,
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: 30,
                child: IconButton(
                    //fill icon depending of _favorite state
                    icon: widget.drink.liked
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
                        widget.drink.liked = !widget.drink.liked;
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
                          "${widget.drink.productTitle}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          //here goes the product descripton
                          "${widget.drink.productDescription}",
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
                                    widget.drink.productSize = ProductSize.CH;
                                    widget.drink.productPrice =
                                        widget.drink.productPriceCalculator();
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
                                    widget.drink.productSize = ProductSize.M;
                                    widget.drink.productPrice =
                                        widget.drink.productPriceCalculator();
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
                                    widget.drink.productSize = ProductSize.G;
                                    widget.drink.productPrice =
                                        widget.drink.productPriceCalculator();
                                    _chico = !sel;
                                    _mediano = !sel;
                                    _grande = sel;
                                  }
                                });
                              }),
                          SizedBox(width: 5.0),
                          Text(
                            "\$${widget.drink.productPrice}",
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
                            widget.drink.productAmount = 1;
                            if (cartList.drinks.isEmpty) {
                              cartList.drinks = <ProductHotDrinks>[
                                widget.drink
                              ];
                            } else {
                              cartList.drinks.add(widget.drink);
                            }
                            _scaffoldKey.currentState.showSnackBar(snackBar);
                          },
                          color: Colors.grey,
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          child: Text('COMPRAR AHORA'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PayPage(
                                        product: widget.drink,
                                      )),
                            );
                          },
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
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}

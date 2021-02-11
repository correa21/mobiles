import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

class ItemGrainsDetail extends StatefulWidget {
  final ProductGrains grain;
  ItemGrainsDetail({
    Key key,
    this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsDetailState createState() => _ItemGrainsDetailState();
}

class _ItemGrainsDetailState extends State<ItemGrainsDetail> {
  bool _cuarto = false;
  bool _kilo = true;

  @override
  Widget build(BuildContext context) {
    final ProductGrains grain = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("${grain.productTitle}"),
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
                  //Container(height: 180),
                ),
              ),
              Align(
                alignment: Alignment(0.0, -0.90),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                  child: Image.network(
                    "${grain.productImage}",
                    fit: BoxFit.contain,
                    height: 300,
                    width: 300,
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: 30,
                child: IconButton(
                    //fill icon depending of _favorite state
                    icon: grain.liked
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
                        grain.liked = !grain.liked;
                      });
                    }),
              ),
              Positioned.fill(
                top: 300,
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
                          "${grain.productTitle}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          //here goes the product descripton
                          "${grain.productDescription}",
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
                                'Cuarto',
                              ),
                              selected: _cuarto,
                              onSelected: (bool sel) {
                                setState(() {
                                  if (sel != _cuarto && true == sel) {
                                    grain.productWeight = ProductWeight.CUARTO;
                                    grain.productPrice =
                                        grain.productPriceCalculator();
                                    _cuarto = sel;
                                    _kilo = !sel;
                                  }
                                });
                              }),
                          SizedBox(width: 15.0),
                          ChoiceChip(
                              label: Text(
                                'Kilo',
                              ),
                              selected: _kilo,
                              onSelected: (bool sel) {
                                setState(() {
                                  if (sel != _kilo && true == sel) {
                                    grain.productWeight = ProductWeight.KILO;
                                    grain.productPrice =
                                        grain.productPriceCalculator();
                                    _cuarto = !sel;
                                    _kilo = sel;
                                  }
                                });
                              }),
                          SizedBox(width: 15.0),
                          SizedBox(width: 5.0),
                          Text(
                            "\$${grain.productPrice}",
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
                          onPressed: () {},
                          color: Colors.grey,
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          child: Text('COMPRAR AHORA'),
                          onPressed: () {
                            ProductItemCart prod = ProductItemCart(
                                productAmount: grain.productAmount,
                                productPrice: grain.productPrice,
                                productTitle: grain.productTitle,
                                typeOfProduct: ProductType.GRANO);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cart(
                                        productsList: [prod],
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

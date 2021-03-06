import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/pay_page.dart';
import 'package:flutter/material.dart';

class ItemGrainsDetail extends StatefulWidget {
  final ProductGrains grains;
  ItemGrainsDetail({Key key, @required this.grains}) : super(key: key);

  @override
  _ItemGrainsDetailState createState() => _ItemGrainsDetailState();
}

class _ItemGrainsDetailState extends State<ItemGrainsDetail> {
  bool _cuarto = false;
  bool _kilo = true;

  @override
  Widget build(BuildContext context) {
    final ProductCart cartList = ModalRoute.of(context).settings.arguments;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final snackBar =
        SnackBar(content: Text('Se a aniadido un producto a tu carrito'));
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("${widget.grains.productTitle}"),
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
                    "${widget.grains.productImage}",
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
                    icon: widget.grains.liked
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
                        widget.grains.liked = !widget.grains.liked;
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
                          "${widget.grains.productTitle}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          //here goes the product descripton
                          "${widget.grains.productDescription}",
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
                                    widget.grains.productWeight =
                                        ProductWeight.CUARTO;
                                    widget.grains.productPrice =
                                        widget.grains.productPriceCalculator();
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
                                    widget.grains.productWeight =
                                        ProductWeight.KILO;
                                    widget.grains.productPrice =
                                        widget.grains.productPriceCalculator();
                                    _cuarto = !sel;
                                    _kilo = sel;
                                  }
                                });
                              }),
                          SizedBox(width: 15.0),
                          SizedBox(width: 5.0),
                          Text(
                            "\$${widget.grains.productPrice}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      BuyButtons(
                          widget: widget,
                          cartList: cartList,
                          scaffoldKey: _scaffoldKey,
                          snackBar: snackBar),
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

class BuyButtons extends StatelessWidget {
  const BuyButtons({
    Key key,
    @required this.widget,
    @required this.cartList,
    @required GlobalKey<ScaffoldState> scaffoldKey,
    @required this.snackBar,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final ItemGrainsDetail widget;
  final ProductCart cartList;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final SnackBar snackBar;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(buttonMinWidth: 159, children: <Widget>[
      FlatButton(
        child: Text('AGREGAR AL CARRITO'),
        onPressed: () {
          widget.grains.productAmount = 1;
          if (cartList.grains.isEmpty) {
            cartList.grains = <ProductGrains>[widget.grains];
          } else {
            cartList.grains.add(widget.grains);
          }
          _scaffoldKey.currentState.showSnackBar(snackBar);
        },
        color: Colors.grey,
      ),
      // ignore: deprecated_member_use
      FlatButton(
        child: Text('COMPRAR AHORA'),
        onPressed: () {
          //TODO: el push debe de ser a la pagina de pagos
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PayPage(
                      product: widget.grains,
                    )),
          );
        },
        color: Colors.grey,
      )
    ]);
  }
}

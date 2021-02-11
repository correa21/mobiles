import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:flutter/material.dart';

class ItemdessertsDetail extends StatefulWidget {
  final ProductDesserts dessert;
  ItemdessertsDetail({
    Key key,
    this.dessert,
  }) : super(key: key);

  @override
  _ItemdessertsDetailState createState() => _ItemdessertsDetailState();
}

class _ItemdessertsDetailState extends State<ItemdessertsDetail> {
  @override
  Widget build(BuildContext context) {
    final ProductDesserts dessert = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("${dessert.productTitle}"),
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
                      "${dessert.productImage}",
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
                    icon: dessert.liked
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
                        dessert.liked = !dessert.liked;
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
                          "${dessert.productTitle}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          //here goes the product descripton
                          "${dessert.productDescription}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left,
                        ),
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
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}

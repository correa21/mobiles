import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/pay_page.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  bool _empty = true;
  @override
  void initState() {
    super.initState();
    if (null != widget.productsList && widget.productsList.isNotEmpty) {
      for (var item in widget.productsList) {
        _total += (item.productPrice * item.productAmount);
      }
      _empty = false;
    } else {
      _empty = true;
      _total = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: (_empty)
                  ? Center(
                      child: Text(
                        "Tu carrito está vacio",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    )
                  : Stack(
                      children: [
                        ListView.builder(
                          itemCount: widget.productsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemCart(
                              onAmountUpdated: _priceUpdate,
                              product: widget.productsList[index],
                            );
                          },
                        ),
                        Positioned.fill(
                          top: 500,
                          bottom: -35,
                          left: -30,
                          right: -30,
                          child: Card(
                            elevation: 0,
                            margin: EdgeInsets.all(24.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    )),
          Positioned(
            bottom: 100,
            left: 35,
            child: Text(
              "Total: \$$_total",
              style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.grey[400]),
              textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ButtonBar(buttonMinWidth: 159, children: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('PAGAR'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PayPage(
                              product: widget.productsList[0],
                            )),
                  );
                },
                color: Colors.grey,
              ),
            ]),
          )
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}

import 'package:flutter/material.dart';

class PayPage extends StatefulWidget {
  final dynamic product;
  PayPage({
    Key key,
    @required this.product,
  }) : super(key: key);
  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  double _total = 0.0;
  @override
  void initState() {
    super.initState();
    _total = widget.product.productPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PAGOS"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Stack(children: <Widget>[
              SizedBox(
                width: 700,
              ),
              Positioned.fill(
                top: 0,
                child: Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.grey[200],
                  //Container(height: 180),
                ),
              ),
              Positioned.fill(
                top: 190,
                child: Container(
                    height: 160,
                    width: 600,
                    margin: EdgeInsets.only(
                        top: 28, bottom: 24, left: 24, right: 24),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.all(24.0),
                    child: ListView(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.credit_card_rounded,
                            size: 50,
                            color: Colors.grey[400],
                          ),
                          title: Text(
                            'Tarjeta de crédito',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.payments,
                            size: 50,
                            color: Colors.grey[400],
                          ),
                          title: Text(
                            'Pay Pal',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.card_giftcard_rounded,
                            size: 50,
                            color: Colors.grey[400],
                          ),
                          title: Text(
                            'Tarjeta de regalo',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                          ),
                          onTap: () {},
                        )
                      ],
                    )),
              ),
              Positioned(
                top: 25,
                left: 110,
                child: Image.network(
                  "${widget.product.productImage}",
                  fit: BoxFit.contain,
                  height: 150,
                  width: 150,
                ),
              ),
              Positioned(
                  top: 150,
                  left: 150,
                  child: Text(
                    "${widget.product.productTitle}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                  )),
              Positioned(
                bottom: 50,
                right: 50,
                child: Text("Total: \$${widget.product.productPrice}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
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

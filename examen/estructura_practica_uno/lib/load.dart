import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key key}) : super(key: key);

  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Image.asset('assets/images/splashscreen.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover),
        Container(
          child: Image.asset(
            'assets/images/logo.png',
            width: 250,
            height: 150,
            alignment: Alignment.center,
          ),
          alignment: Alignment(0.1, -0.5),
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key key}) : super(key: key);

  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff214254),
        body: SafeArea(
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                SizedBox(height: 80.0),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      width: 250,
                      height: 150,
                      alignment: Alignment.center,
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
                SizedBox(height: 120.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/register');
                  },
                  child: Text(
                    'REGISTRATE',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                  ),
                ),
                //REGISTER BUTTON
                SizedBox(height: 12.0),
                //LOGIN BUTTON
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/login');
                    },
                    child: Text(
                      'INGRESA',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.5,
                    ))
              ]),
        ));
  }
}

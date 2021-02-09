import 'package:estructura_practica_1/load.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 8,
      navigateAfterSeconds: new LoadScreen(),
      image: Image.asset(
        'assets/images/logo.png',
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
      ),
      useLoader: false,
      photoSize: 115.0,
      imageBackground: Image.asset('assets/images/splashscreen.jpg').image,
      //backgroundColor: Colors.red,
    );
  }
}

class AfterSplash extends StatelessWidget {
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

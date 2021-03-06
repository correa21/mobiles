import 'package:estructura_practica_1/login.dart';
import 'package:estructura_practica_1/pay_page.dart';
import 'package:estructura_practica_1/register.dart';
import 'package:estructura_practica_1/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:splashscreen/splashscreen.dart';

import 'load.dart';
import 'models/product_hot_drinks.dart';
import 'utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: PRIMARY_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MySplashScreen(),
        '/register': (context) => Register(),
        '/firstPage': (context) => LoadScreen(),
        '/login': (context) => LoginPage(),
        '/home': (context) => Home(title: APP_TITLE),
      },
      //home: LoginPage(), //Home(title: APP_TITLE),
    );
  }
}

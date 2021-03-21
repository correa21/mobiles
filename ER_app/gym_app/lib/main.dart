import 'package:flutter/material.dart';
import 'Athlete/home.dart';
import 'Coach/coach_home.dart';
import 'Coach/coach_athletes.dart';
import 'login.dart';
import 'load.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaterialApp',
        theme: ThemeData(primaryColor: Colors.indigo),
        initialRoute: '/',
        routes: {
            '/': (context)=> LoginPage(),
            '/usr/athlete':(context)=>Home(),
            '/usr/coach/routine': (context)=> CoachHome(),
            '/usr/coach/athleteList': (context)=> CoachAthletes(),

        },);
  }
}

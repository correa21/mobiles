import 'package:flutter/material.dart';
import 'package:gym_app/widgets/Exercise_description.dart';
import 'Athlete/home.dart';
import 'widgets/coach_exercise.dart';
import 'profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaterialApp',
        theme: ThemeData(primaryColor: Colors.indigo),
        home: Scaffold(
          body: Home(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:gym_app/Coach/coach_home.dart';
import 'package:gym_app/models/coach.dart';
import 'package:gym_app/models/atletas.dart';
import 'package:http/http.dart' as http;
import 'package:gym_app/secrets.dart';
import 'dart:async';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  LoginPage({Key key}) : super(key: key);
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            //LOGIN BUTTON
            ElevatedButton(
                onPressed: () async {
                  String coachQuery =
                      'entrenadores?Nombre=${_usernameController.text}';
                  String athleteQuery =
                      'Atletas?Nombre=${_usernameController.text}';
                  List<Coach> coachElement = await _getCoachList(coachQuery);
                  List<Coach> athleteElement =
                      await _getCoachList(athleteQuery);
                  if (coachElement != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CoachHome(coach: coachElement[0])));
                  } else {}
                },
                child: Text(
                  'INGRESA',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.5,
                ))
          ]),
    ));
  }

  Future<List<Coach>> _getCoachList(String query) async {
    List<Coach> _listaEntrenadores;
    final _uri = Uri.parse(API_KEY + query);
    try {
      final response = await http.get(
        _uri,
      );
      if (response.body != null) {
        List<dynamic> data = jsonDecode(response.body);
        _listaEntrenadores =
            ((data).map((element) => Coach.fromJson(element))).toList();
        return _listaEntrenadores;
      }
      return [];
    } catch (e) {
      throw "Ha ocurrrido un error $e";
    }
  }

  Future<List<Coach>> _getAthleteList(String query) async {
    List<Coach> _listaAtletas;
    final _uri = Uri.parse(API_KEY + query);
    try {
      final response = await http.get(
        _uri,
      );
      if (response.body != null) {
        List<dynamic> data = jsonDecode(response.body);
        _listaAtletas =
            ((data).map((element) => Coach.fromJson(element))).toList();
        return _listaAtletas;
      }
      return [];
    } catch (e) {
      throw "Ha ocurrrido un error $e";
    }
  }
}

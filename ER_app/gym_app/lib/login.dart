import 'package:flutter/material.dart';

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
                onPressed: () {
                  (_usernameController.text == 'coach')
                      ? Navigator.of(context).popAndPushNamed('/usr/coach')
                      : Navigator.of(context).popAndPushNamed('/usr/athlete');
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

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
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Username',
                  ),
                ),
                SizedBox(height: 12.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                ButtonBar(children: <Widget>[
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                      Navigator.of(context).popAndPushNamed('/firstPage');
                    },
                    color: Colors.grey,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text('NEXT'),
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    },
                    color: Theme.of(context).accentColor,
                  )
                ]),
              ]),
        ));
  }
}

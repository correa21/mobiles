import 'package:flutter/material.dart';

void main() => runApp(Register());

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _termsController = false;
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
                SizedBox(height: 50.0),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Nombre Completo',
                  ),
                ),
                SizedBox(height: 12.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                  ),
                  obscureText: true,
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
                ListTile(
                  leading: Checkbox(
                      value: _termsController,
                      onChanged: (bool newValue) {
                        setState(() {
                          _termsController = newValue;
                        });
                      }),
                  title: Text(
                    'ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO',
                    textScaleFactor: 0.75,
                  ),
                ),
                RaisedButton(
                  child: Text('REGISTRATE'),
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/home');
                  },
                  color: Color(0xffbcb0a1),
                ),
              ]),
        ));
  }
}

import 'package:cart_hive/home/home_page.dart';

import 'package:flutter/material.dart';

void main() async {
  //TODO: inicializar hive y registrar adapters
    WidgetsFlutterBinding.ensureInitialized();
    //final _localStorage await get
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

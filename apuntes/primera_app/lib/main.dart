import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Container(
          color: Color(0xff464a47),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.thumb_up, color: Colors.grey[200]),
                  SizedBox(height: 8),
                  Text(
                    "999",
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.thumb_down,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "888",
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.share, color: Colors.grey[200]),
                  SizedBox(height: 8),
                  Text(
                    "Compartir",
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.download_rounded, color: Colors.grey[200]),
                  SizedBox(height: 8),
                  Text(
                    "Descargar",
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.save, color: Colors.grey[200]),
                  SizedBox(height: 8),
                  Text(
                    "Guardar",
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

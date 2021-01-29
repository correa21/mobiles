import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return MaterialApp(
                title: 'MaterialApp',
                home: HomePage(),
        );
    }
}

class HomePage extends StatefulWidget {
    const HomePage({
        Key key,
    }) :super (key: key);

    @override
    Widget build(BuildContext context){
        return Scaffold(
                appBar: AppBar(
                        title: Text("Info ITESO"),
                ),
body: SingleChildScrollView(
        child: Column(
          children: [
            //Image.asset("assets/iteso.jpg"),
            Image.network("https://pbs.twimg.com/media/DburBCaVQAAM_2g.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Row(
                children: [
                  // textos
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ITESO, Universidad Jesuita de Guadalajara",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("San Pedro Tlaquepaque"),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {
                      //TODO: hacer lo necesario para incrementar y cambiar colores
                    },
                  ),
                  Text("999"),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //botones
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 64,
                      ),
                      Text("Correo"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.call,
                        size: 64,
                      ),
                      Text("Llamar"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.directions,
                        size: 64,
                      ),
                      Text("Ruta"),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                  "Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas"),
            )
          ],
        ),
      ),
    );
  }
}

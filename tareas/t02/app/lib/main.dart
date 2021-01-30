import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool liked = false;
  bool disliked = false;
  int _likeCounter = 0;
  int _dislikeCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      color: liked ? Colors.blue : Colors.black45,
                      onPressed: () {
                        setState(
                          () {
                            liked = !liked;
                            if (liked) {
                              _likeCounter++;
                            }
                          },
                        );
                      }),
                  Text("$_likeCounter"),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                      icon: Icon(Icons.thumb_down),
                      color: disliked ? Colors.red : Colors.black45,
                      onPressed: () {
                        setState(
                          () {
                            disliked = !disliked;
                            if (disliked) {
                              _dislikeCounter++;
                              _likeCounter--;
                            }
                          },
                        );
                      }),
                  Text("$_dislikeCounter"),
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(title: Text("Info ITESO"), actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.keyboard_control),
        onPressed: () {
          String formattedDateTime = DateFormat('yyyy-MM-dd \n kk:mm:ss')
              .format(DateTime.now())
              .toString();
          if (_likeCounter % 2 == 0) {
            buildPairDialog(context);
          } else {
            buildDateDialog(context, formattedDateTime);
          }
          print('entre a mostrar el dialogo');
          //}
        },
      )
    ]);
  }

  Future buildPairDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => new AlertDialog(
          title: new Text('Par'),
          content: new Text('El contador de likes es par'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ]),
    );
  }

  Future buildDateDialog(BuildContext context, String formattedDateTime) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => new AlertDialog(
          title: new Text('Fecha y Hora'),
          content: new Text(formattedDateTime),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ]),
    );
  }
}

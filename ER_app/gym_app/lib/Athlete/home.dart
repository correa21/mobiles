import 'package:flutter/material.dart';
import 'package:gym_app/widgets/Exercise_description.dart';
import 'package:gym_app/widgets/Routine_element.dart';
import 'package:gym_app/widgets/coach_exercise.dart';
import '../profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('${widget.title}'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert_rounded), onPressed: () {})
          ],
        ),
        drawer: Profile(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            ListTile(
              title: Text('EL musculo de hoy es: Biceps'),
              subtitle: Text('3 series x 12 reps'),
              trailing: Container(
                child: Image.network(
                  'https://muscleseek.com/wp-content/uploads/2013/12/big-bicep.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 170,
              child: ListView(
                children: <Widget>[
                  GestureDetector(
                    child: ListTile(
                      title: Text('Curl'),
                      subtitle: Text('3 series x 12 reps'),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        elevation: 30000,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return ExerciseDescription(
                            key: _scaffoldKey,
                            title: 'CURL',
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}

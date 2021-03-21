import 'package:flutter/material.dart';
import 'package:gym_app/widgets/Routine_element.dart';
import 'package:gym_app/Coach/coachProfile.dart';
import 'package:gym_app/widgets/New_Excersise.dart';
import 'package:gym_app/widgets/coach_exercise.dart';
import '../profile.dart';

class CoachHome extends StatefulWidget {
  final String title;
  CoachHome({Key key, this.title}) : super(key: key);

  @override
  _CoachHomeState createState() => _CoachHomeState();
}

class _CoachHomeState extends State<CoachHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Rutina del día'),
        actions: <Widget>[
                      IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert_rounded), onPressed: () {})
          
        ],
      ),
    drawer: CoachProfile(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: RoutineElement(
              title: 'Curl',
              image: 
                  'https://muscleseek.com/wp-content/uploads/2013/12/big-bicep.jpg',
            ),
          ),
          GestureDetector(
            child: RoutineElement(
              title: 'Curl',
              image: "https://dkpp.go.id/wp-content/uploads/2018/10/photo.jpg",
            ),
          ),
          GestureDetector(
            child: RoutineElement(
              title: 'Curl',
              image: "https://dkpp.go.id/wp-content/uploads/2018/10/photo.jpg",
            ),
          )
        ],
      ),
        floatingActionButton: FloatingActionButton(onPressed: (){
                                 showModalBottomSheet(
                        context: context,
                        elevation: 30000,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return  NewExcersise();
        },);},
              child: const Icon(Icons.add,size: 39,),
              backgroundColor: Colors.indigo,),
    );
  }
}

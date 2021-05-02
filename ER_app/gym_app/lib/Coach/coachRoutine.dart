import 'package:flutter/material.dart';
import 'package:gym_app/Coach/bloc/coach_bloc.dart';
import 'package:gym_app/widgets/Routine_element.dart';
import 'package:gym_app/Coach/coachProfile.dart';
import 'package:gym_app/widgets/New_Excersise.dart';
import 'package:gym_app/widgets/coach_exercise.dart';
import '../profile.dart';

class CoachRoutine extends StatefulWidget {
  final String title;
  CoachRoutine({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _CoachRoutineState createState() => _CoachRoutineState();
}

class _CoachRoutineState extends State<CoachRoutine> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            elevation: 30000,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return NewExcersise();
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 39,
        ),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}

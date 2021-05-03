import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/Coach/bloc/coach_bloc.dart';
import 'package:gym_app/Coach/coachRoutine.dart';
import 'package:gym_app/Coach/coach_athletes.dart';
import 'package:gym_app/widgets/Routine_element.dart';
import 'package:gym_app/Coach/coachProfile.dart';
import 'package:gym_app/models/coach.dart';
import 'package:gym_app/widgets/New_Excersise.dart';
import 'package:gym_app/widgets/coach_exercise.dart';
import '../constants.dart';
import '../Athlete/profile.dart';

class CoachHome extends StatefulWidget {
  final String title;
  Coach coach;
  CoachHome({Key key, this.title, @required this.coach}) : super(key: key);

  @override
  _CoachHomeState createState() => _CoachHomeState();
}

class _CoachHomeState extends State<CoachHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  CoachBloc coachBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${widget.coach.nombre}!'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert_rounded), onPressed: () {})
        ],
      ),
      drawer: CoachProfile(bloc: coachBloc),
      body: BlocProvider(
          create: (context) {
            coachBloc = CoachBloc();
            coachBloc.add(ShowAthleteListEvent());
            return coachBloc;
          },
          child: BlocConsumer<CoachBloc, CoachState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NewRoutineState) {
                return CoachRoutine();
              } else if (state is AthleteProfile) {
                //TODO: show single athlete information card
              } else if (state is ShowAthletsState) {
                return CoachAthletes(
                  listaAtletas: widget.coach.atletas,
                );
              }
            },
          )),
    );
  }
}

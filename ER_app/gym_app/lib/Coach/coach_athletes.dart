import 'package:flutter/material.dart';
import 'package:gym_app/Coach/bloc/coach_bloc.dart';
import 'package:gym_app/widgets/Exercise_description.dart';
import 'package:gym_app/Coach/coachProfile.dart';
import 'package:gym_app/widgets/Routine_element.dart';
import 'package:gym_app/widgets/coach_exercise.dart';
import '../Athlete/profile.dart';

class CoachAthletes extends StatefulWidget {
  final String title;
  final CoachBloc bloc;
  CoachAthletes({Key key, this.title, this.bloc}) : super(key: key);

  @override
  _CoachAthletesState createState() => _CoachAthletesState();
}

class _CoachAthletesState extends State<CoachAthletes> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        ListTile(
          title: Text(
            'Atletas',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          height: MediaQuery.of(context).size.height - 270,
          child: ListView(
            children: <Widget>[
              GestureDetector(
                child: ListTile(
                  leading: CircleAvatar(
                      child: Image.network(
                    "https://dkpp.go.id/wp-content/uploads/2018/10/photo.jpg",
                  )),
                  title: Text(
                    'Joe Smith',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                onTap: () {
                  //TODO: implement profile per user in data base
                  //widget.bloc.add(DisplayAthleteEvent());
                },
              ),
              GestureDetector(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.network(
                      "https://dkpp.go.id/wp-content/uploads/2018/10/photo.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    'Adres Gómez',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        )
      ]),
    ));
  }
}

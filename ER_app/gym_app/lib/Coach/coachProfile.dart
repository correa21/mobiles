import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/Coach/bloc/coach_bloc.dart';
import 'package:gym_app/constants.dart';

class CoachProfile extends StatelessWidget {
  final CoachBloc bloc;
  const CoachProfile({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 300,
      child: Scaffold(
        appBar: AppBar(
          title: Text(PROFILE_TITLE),
        ),
        body: Padding(
          padding: EdgeInsets.all(24.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 150,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        PROFILE_PICTURE,
                      ),
                      minRadius: 40,
                      maxRadius: 80,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    PROFILE_NAME,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(PROFILE_EMAIL),
                  SizedBox(
                    height: 16,
                  ),
                  ListTile(
                    title: Text(PROFILE_ROUTINE),
                    leading: Icon(Icons.fitness_center),
                    onTap: () {
                      bloc.add(NewRoutineEvent());
                    },
                  ),
                  ListTile(
                    title: Text(PROFILE_COACH_ATHLETE),
                    leading: Icon(Icons.person),
                    onTap: () {
                      bloc.add(ShowAthleteListEvent());
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text(PROFILE_LOGOUT),
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed('/');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:gym_app/models/coach.dart';
import 'package:gym_app/models/atletas.dart';
import 'package:gym_app/models/deporte.dart';
import 'package:gym_app/secrets.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'coach_event.dart';
part 'coach_state.dart';

List<Coach> listaEntrenadores;

class CoachBloc extends Bloc<CoachEvent, CoachState> {
  CoachBloc() : super(CoachInitial());

  @override
  Stream<CoachState> mapEventToState(
    CoachEvent event,
  ) async* {
    //_getCoachList('entrenadores');
    if (event is ShowAthleteListEvent) {
      //TODO: pull athlete list
      // _getCoachList('entrenadores');
      // print(listaEntrenadores[0].atletas);
      yield ShowAthletsState();
    } else if (event is NewRoutineEvent) {
      yield NewRoutineState();
    }
  }
}

Future<List<Coach>> _getCoachList(String query) async {
  final _uri = Uri.parse(API_KEY + query);
  try {
    final response = await http.get(
      _uri,
    );
    if (response.body != null) {
      List<dynamic> data = jsonDecode(response.body);
      listaEntrenadores =
          ((data).map((element) => Coach.fromJson(element))).toList();
      return listaEntrenadores;
    }
    return [];
  } catch (e) {
    throw "Ha ocurrrido un error $e";
  }
}

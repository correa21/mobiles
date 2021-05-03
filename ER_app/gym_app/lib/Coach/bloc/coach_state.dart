part of 'coach_bloc.dart';

@immutable
abstract class CoachState {}

class CoachInitial extends CoachState {}

class ShowAthletsState extends CoachState {
//   final List<Atletas> listaAtletas;

//   ShowAthletsState({@required this.listaAtletas});
//   @override
//   List<Object> get props => [listaAtletas];
}

class NewRoutineState extends CoachState {}

class AthleteProfile extends CoachState {}

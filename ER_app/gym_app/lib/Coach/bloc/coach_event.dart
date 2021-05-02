part of 'coach_bloc.dart';

@immutable
abstract class CoachEvent {}

class NewRoutineEvent extends CoachEvent {}

class ShowAthleteListEvent extends CoachEvent {}

class DisplayAthleteEvent extends CoachEvent {}

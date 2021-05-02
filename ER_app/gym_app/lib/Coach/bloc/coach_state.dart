part of 'coach_bloc.dart';

@immutable
abstract class CoachState {}

class CoachInitial extends CoachState {}

class ShowAthletsState extends CoachState {}

class NewRoutineState extends CoachState {}

class AthleteProfile extends CoachState {}

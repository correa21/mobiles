import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'coach_event.dart';
part 'coach_state.dart';

class CoachBloc extends Bloc<CoachEvent, CoachState> {
  CoachBloc() : super(CoachInitial());

  @override
  Stream<CoachState> mapEventToState(
    CoachEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

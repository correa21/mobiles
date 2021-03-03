part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class StartEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SkipEvent extends HomeEvent {
  final bool result = false;
  @override
  // TODO: implement props
  List<Object> get props => [result];
}

class GotEvent extends HomeEvent {
  final bool result = true;
  @override
  // TODO: implement props
  List<Object> get props => [result];
}

class EndEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RestartEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

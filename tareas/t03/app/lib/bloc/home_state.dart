part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class JuegoIniciadoState extends HomeState {
  final String palabra;
  final String titulo;
  final int contador;

  JuegoIniciadoState(
      {@required this.palabra, @required this.titulo, @required this.contador});

  @override
  // TODO: implement props
  List<Object> get props => [palabra, titulo, contador];
}

class JuegoNextState extends HomeState {
  final String palabra;
  final String titulo;
  final int contador;

  JuegoNextState(
      {@required this.palabra, @required this.titulo, @required this.contador});

  @override
  // TODO: implement props
  List<Object> get props => [palabra, titulo, contador];
}

class JuegoEndState extends HomeState {
  final String titulo;
  final int contador;

  JuegoEndState({@required this.titulo, @required this.contador});

  @override
  // TODO: implement props
  List<Object> get props => [titulo, contador];
}

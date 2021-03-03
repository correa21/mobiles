import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  List<String> list1 = ["Perro", "Gato", "Guitarra", 'Tree', 'Android'];
  List<String> list2 = ["Perro", "Gato", "Guitarra", 'Tree', 'Android'];
  int listSize = 0;
  int index = 0;
  int count = 0;
  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is StartEvent) {
      list1.shuffle();
      list2.shuffle();
      listSize = list1.length;
      count = 0;
      index = 0;
      yield JuegoIniciadoState(
          contador: count, palabra: list1[index], titulo: "The word is...");
    } else if (event is SkipEvent) {
      if (list1[index] != list2[index]) count++;
      index++;
      if (index < listSize)
        yield JuegoIniciadoState(
            contador: count, palabra: list1[index], titulo: "The word is....");
      else
        yield JuegoEndState(contador: count, titulo: "You Scored");
    } else if (event is GotEvent) {
      if (list1[index] == list2[index]) count++;
      index++;
      if (index < listSize)
        yield JuegoIniciadoState(
            contador: count, palabra: list1[index], titulo: "The word is....");
      else
        yield JuegoEndState(contador: count, titulo: "You Scored");
    } else if (event is EndEvent) {
      yield JuegoEndState(contador: count, titulo: "You Scored");
    } else if (event is RestartEvent) {
      listSize = list1.length;
      count = 0;
      index = 0;
      yield HomeInitial();
    }
  }
}

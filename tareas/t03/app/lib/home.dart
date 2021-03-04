import 'package:app/bloc/home_bloc.dart';
import 'package:app/widgets/GameOverDisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/InGameDisplay.dart';
import 'widgets/startDisplay.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Guess the Word'),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is JuegoIniciadoState) {
              return InGameButtons(state.titulo, state.palabra, state.contador,
                  _skip, _gotIt, _endGame, context);
            } else if (state is JuegoEndState) {
              return GameOverDisplay(
                  state.titulo, state.contador, _reStart, context);
            } else
              return StartDisplay(_startGame, context);
          },
        ),
      ),
    );
  }
}

Function _skip(BuildContext context) {
  BlocProvider.of<HomeBloc>(context).add(SkipEvent());
}

Function _gotIt(BuildContext context) {
  BlocProvider.of<HomeBloc>(context).add(GotEvent());
}

Function _endGame(BuildContext context) {
  BlocProvider.of<HomeBloc>(context).add(EndEvent());
}

Function _reStart(BuildContext context) {
  BlocProvider.of<HomeBloc>(context).add(RestartEvent());
}

Function _startGame(BuildContext context) {
  BlocProvider.of<HomeBloc>(context).add(StartEvent());
}

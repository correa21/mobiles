import 'package:app/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Column(
                            children: [
                              SizedBox(height: 250.0),
                              Text(state.titulo),
                              SizedBox(height: 10.0),
                              Text(
                                state.palabra,
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Text(state.contador.toString()),
                    bottom: 300,
                  ),
                  Positioned(
                    bottom: 50,
                    left: 30,
                    child: MaterialButton(
                        child: Text("SKIP"),
                        color: Colors.grey.shade300,
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(SkipEvent());
                        }),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 155,
                    child: MaterialButton(
                        child: Text("GOT IT"),
                        color: Colors.green,
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(GotEvent());
                        }),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 275,
                    child: MaterialButton(
                        child: Text("END GAME"),
                        color: Colors.grey.shade300,
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(EndEvent());
                        }),
                  )
                ],
              );
            } else if (state is JuegoEndState) {
              return Stack(alignment: Alignment.center, children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Column(
                          children: [
                            SizedBox(height: 250.0),
                            Text(state.titulo),
                            SizedBox(height: 35.0),
                            Text(
                              state.contador.toString(),
                              style: TextStyle(fontSize: 50),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 250,
                  left: 145,
                  child: MaterialButton(
                      child: Text("PLAY AGAIN"),
                      color: Colors.green,
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context).add(RestartEvent());
                      }),
                ),
              ]);
            } else
              return Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Get ready to"),
                          SizedBox(height: 10.0),
                          Text(
                            "Guess the word!",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 150,
                      child: MaterialButton(
                        child: Text(
                          "PLAY",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.green,
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(StartEvent());
                        },
                      ),
                    ),
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}

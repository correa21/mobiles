import 'package:flutter/material.dart';

Widget InGameButtons(String title, String word, int score, Function button1,
    Function button2, Function button3, BuildContext context) {
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
                  Text(title),
                  SizedBox(height: 10.0),
                  Text(
                    word,
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        child: Text(score.toString()),
        bottom: 300,
      ),
      Positioned(
        bottom: 50,
        left: 30,
        child: MaterialButton(
            child: Text("SKIP"),
            color: Colors.grey.shade300,
            onPressed: () {
              button1(context);
            }),
      ),
      Positioned(
        bottom: 50,
        left: 155,
        child: MaterialButton(
            child: Text("GOT IT"),
            color: Colors.green,
            onPressed: () {
              button2(
                  context); //BlocProvider.of<HomeBloc>(context).add(GotEvent());
            }),
      ),
      Positioned(
        bottom: 50,
        left: 275,
        child: MaterialButton(
            child: Text("END GAME"),
            color: Colors.grey.shade300,
            onPressed: () {
              button3(
                  context); //BlocProvider.of<HomeBloc>(context).add(EndEvent());
            }),
      )
    ],
  );
}

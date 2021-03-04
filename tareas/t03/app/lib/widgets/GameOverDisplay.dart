import 'package:flutter/material.dart';

Widget GameOverDisplay(
    String title, int score, Function button1, BuildContext context) {
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
                Text(title),
                SizedBox(height: 35.0),
                Text(
                  score.toString(),
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
            button1(context);
          }),
    ),
  ]);
}

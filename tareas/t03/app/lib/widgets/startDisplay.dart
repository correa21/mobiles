import 'package:flutter/material.dart';

Widget StartDisplay(Function button1, BuildContext context) {
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
              button1(context);
            },
          ),
        ),
      ],
    ),
  );
}

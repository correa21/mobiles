import 'package:flutter/material.dart';

class ExerciseDescription extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  const ExerciseDescription(
      {Key key,
      @required this.title,
      @required this.image,
      @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Stack(
        children: [
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.05,
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(24.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.grey[200],
              child: Container(height: 180),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 763,
            left: MediaQuery.of(context).size.width - 310,
            child: Container(
              margin: EdgeInsets.only(left: 16),
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 125,
                    width: 2000,
                    child: Image.network(image),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height - 580,
            left: MediaQuery.of(context).size.width - 350,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width - 80,
              child: Text(
                "${title}",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height - 750,
            left: MediaQuery.of(context).size.width - 350,
            child: Container(
              height: MediaQuery.of(context).size.height * .20,
              width: MediaQuery.of(context).size.width - 80,
              child: Text(
                description,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

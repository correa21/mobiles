import 'package:flutter/material.dart';
import 'package:gym_app/widgets/Counter.dart';

class CoachExercise extends StatefulWidget {
  final String title;
  final String image;
  CoachExercise({
    Key key,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  @override
  _CoachExerciseState createState() => _CoachExerciseState();
}

class _CoachExerciseState extends State<CoachExercise> {
  @override
  Widget build(BuildContext context) {
    var _rep;
    var _series;
    return Container(
      height: 185,
      child: Stack(
        children: [
          Positioned.fill(
            top: 16,
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(24.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.indigo,
              child: Container(height: 180),
            ),
          ),
          Container(
            height: 125,
            width: 2000,
            margin: EdgeInsets.only(top: 28, bottom: 24, left: 24, right: 24),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 66,
            child: Container(
              margin: EdgeInsets.only(left: 16),
              width: 160,
              child: Text(
                "${widget.title}",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 136,
            child: Counter(
              onDecrement: (_rep) {},
              onIncrement: (_rep) {},
              title: 'Repeticiones',
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 80,
            left: MediaQuery.of(context).size.width - 246,
            child: Counter(
              onDecrement: (_series) {},
              onIncrement: (_series) {},
              title: 'Series',
            ),
          ),
        ],
      ),
    );
  }
}

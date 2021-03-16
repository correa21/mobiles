import 'package:flutter/material.dart';
import 'package:gym_app/widgets/Counter.dart';

class ExerciseDescription extends StatelessWidget {
  final String title;
  const ExerciseDescription({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
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
          Positioned(
            bottom: MediaQuery.of(context).size.height - 150,
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
                    child: Image.network(
                        'https://www.property118.com/wp-content/uploads/2013/06/How-to-I-add-my-picture-to-comments.jpg'),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  Text(
                    "${title}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

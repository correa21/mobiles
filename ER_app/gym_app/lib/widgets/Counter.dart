import 'package:flutter/material.dart';

typedef MyIntCallback(int);

class Counter extends StatefulWidget {
  final MyIntCallback onIncrement; // new code
  final MyIntCallback onDecrement; // new code
  Counter({
    Key key,
    @required this.title,
    this.onIncrement,
    this.onDecrement,
  }) : super(key: key);
  final String title;
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count;
  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${widget.title}'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAddIconButton(),
              SizedBox(
                width: 5,
              ),
              _buildCountContainer(),
              SizedBox(
                width: 5,
              ),
              _buildRemoveIconButton(),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildCountContainer() {
    return Container(
      child: Text(
        '$_count',
        textScaleFactor: 1.5,
      ),
    );
  }

  IconButton _buildAddIconButton() {
    return IconButton(
      icon: Icon(Icons.add_circle_outline),
      color: Colors.indigo,
      onPressed: () {
        setState(() {
          _count++;
        });
        widget.onIncrement(_count);
      },
    );
  }

  IconButton _buildRemoveIconButton() {
    return IconButton(
      icon: Icon(Icons.remove_circle_outline),
      color: Colors.indigo,
      onPressed: () {
        setState(() {
          if (_count >= 1) _count--;
        });
        widget.onDecrement(_count);
      },
    );
  }
}

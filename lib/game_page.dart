import 'dart:math';

import 'package:flutter/material.dart';

import './number_box.dart';
import './game.dart';

import 'dart:developer' as dev;

class GamePage extends StatefulWidget {
  //var gameboard = List<List<int>>.filled(4, List<int>.filled(4, 0));
  final game = Game();

  GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    var length = min(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height) *
        0.9;
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onHorizontalDragUpdate: horizontalDragHandler,
          onVerticalDragUpdate: verticalDragHandler,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(5.0))),
            height: length,
            width: length,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...widget.game.board
                    .map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: e.map((e) => NumberBox(value: e)).toList(),
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void horizontalDragHandler(DragUpdateDetails details) {
    const int sensitivity = 17;

    if (details.delta.dx > sensitivity) {
      dev.log('right', name: 'PointerMove');
      setState(() {
        widget.game.leftToRight();
      });
    } else if (details.delta.dx < -sensitivity) {
      dev.log('left', name: 'PointerMove');
      setState(() {
        widget.game.rightToLeft();
      });
    }
  }

  void verticalDragHandler(DragUpdateDetails details) {
    const int sensitivity = 17;

    if (details.delta.dy > sensitivity) {
      dev.log('down', name: 'PointerMove');
      setState(() {
        widget.game.topToDown();
      });
    } else if (details.delta.dy < -sensitivity) {
      dev.log('up', name: 'PointerMove');
      setState(() {
        widget.game.bottomToUp();
      });
    }
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

import './number_box.dart';
import './game.dart';

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
          onHorizontalDragStart: (details) {
            setState(() {
              if (details.globalPosition.direction.floor() == 1) {
                widget.game.leftToRight();
              } else {
                widget.game.rightToLeft();
              }
            });
          },
          onVerticalDragStart: (details) {
            setState(() {
              if (details.globalPosition.direction.floor() == 1) {
                widget.game.bottomToUp();
              } else {
                widget.game.topToDown();
              }
            });
          },
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
}

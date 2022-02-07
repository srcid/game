import 'dart:developer' as dev;
import 'dart:math';

class Game {
  var _board = [
    [0, 2, 2, 0],
    [0, 0, 4, 0],
    [0, 4, 0, 0],
    [0, 0, 0, 0],
  ];

  List<List<int>> get board => _board;

  void leftToRight() {
    dev.log('left to right', name: 'game');
  }

  void rightToLeft() {
    dev.log('right to left', name: 'game');
  }

  void topToDown() {
    dev.log('top to down', name: 'game');
  }

  void bottomToUp() {
    dev.log('bottom to up', name: 'game');
  }
}

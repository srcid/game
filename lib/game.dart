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

    int i, j, p;
    List<int> newRow;

    dev.log(_board.toString().replaceAll('],', '],\n'), name: 'left to right');

    for (i = 0; i < 4; i++) {
      newRow = [0, 0, 0, 0];
      p = 3;
      for (j = 3; j >= 0; j--) {
        if (_board[i][j] != 0) {
          if (newRow[p] == _board[i][j]) {
            newRow[p] += _board[i][j];
            p--;
          } else {
            if (newRow[p] != 0) p--;
            newRow[p] = _board[i][j];
          }
        }
      }
      _board[i] = newRow;
    }

    dev.log(_board.toString().replaceAll('],', '],\n'), name: 'left to right');
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

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

    dev.log(_board.toString().replaceAll('],', '],\n'), name: 'left to right');

    _board = _board.map((row) {
      List<int> newRow = [];
      bool lockSum = true;

      for (final e in row.where((element) => element != 0)) {
        if (lockSum || newRow.last != e) {
          newRow.add(e);
          lockSum = false;
        } else {
          newRow.add(e + newRow.removeLast());
          lockSum = true;
        }
      }

      newRow.insertAll(newRow.length, List.filled(4 - newRow.length, 0));

      dev.log(newRow.toString(), name: 'newrow(${_board.indexOf(row)})');

      return newRow.toList();
    }).toList();

    dev.log(_board.toString().replaceAll('],', '],\n'), name: 'left to right');
  }

  void topToDown() {
    dev.log('top to down', name: 'game');

    dev.log(_board.toString().replaceAll('],', '],\n'), name: 'top to down');

    for (int i = 0; i < 4; i++) {
      final col = _board.map((e) => e[i]).toList();
      List<int> newCol = [];
      bool lockSum = true;

      for (final e in col.reversed.where((element) => element != 0)) {
        if (lockSum || newCol.last != e) {
          newCol.add(e);
          lockSum = false;
        } else {
          newCol.add(e + newCol.removeLast());
          lockSum = true;
        }
      }

      newCol.insertAll(newCol.length, List.filled(4 - newCol.length, 0));

      dev.log(newCol.toString().replaceAll(', ', ',\n '), name: 'newcol(${i})');

      for (int j = 0; j < 4; j++) {
        _board[j][i] = newCol.removeLast();
      }
    }

    dev.log(_board.toString().replaceAll('],', '],\n'), name: 'top to down');
  }

  void bottomToUp() {
    dev.log('bottom to up', name: 'game');

    for (int i = 0; i < 4; i++) {
      final col = _board.map((e) => e[i]).toList();
      List<int> newCol = [];
      bool lockSum = true;

      for (final e in col.where((element) => element != 0)) {
        if (lockSum || newCol.last != e) {
          newCol.add(e);
          lockSum = false;
        } else {
          newCol.add(e + newCol.removeLast());
          lockSum = true;
        }
      }

      newCol.insertAll(newCol.length, List.filled(4 - newCol.length, 0));

      dev.log(newCol.toString().replaceAll(', ', ',\n '), name: 'newcol(${i})');

      for (int j = 0; j < 4; j++) {
        _board[j][i] = newCol.removeAt(0);
      }
    }

    dev.log(_board.toString().replaceAll('],', '],\n'), name: 'bottom to up');

    dev.log(_board.toString().replaceAll('],', '],\n'), name: 'bottom to up');
  }
}

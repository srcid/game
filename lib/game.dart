import 'dart:developer' as dev;
import 'dart:math';

class Game {
  var _board = [
    [0, 2, 2, 0],
    [0, 0, 4, 0],
    [8, 4, 0, 0],
    [8, 8, 0, 32],
  ];

  static const _canidates = [2, 2, 2, 4];

  List<List<int>> get board => _board;

  void leftToRight() {
    dev.log('left to right', name: 'game');

    dev.log(_board.toString().replaceAll('],', '],\n'), name: 'left to right');

    _board = _board.map((row) {
      List<int> newRow = [];
      bool lockSum = true;

      for (final e in row.reversed.where((element) => element != 0)) {
        if (lockSum || newRow.last != e) {
          newRow.add(e);
          lockSum = false;
        } else {
          newRow.add(e + newRow.removeLast());
          lockSum = true;
        }
      }

      newRow.insertAll(newRow.length, List.filled(4 - newRow.length, 0));

      return newRow.reversed.toList();
    }).toList();

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

      return newRow;
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

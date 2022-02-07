import 'dart:math';

import 'package:flutter/material.dart';

class NumberBox extends StatelessWidget {
  final int value;

  static const colorOf = {
    0: Colors.grey,
    2: Colors.amber,
    4: Colors.pink,
    8: Colors.white,
    16: Colors.orange,
    32: Colors.green,
    64: Colors.brown,
    128: Colors.cyan,
    256: Colors.purple,
    512: Colors.red,
    1024: Colors.lime,
    2048: Colors.deepOrange,
  };

  const NumberBox({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var length = min(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height) *
        0.2;
    return Container(
      decoration: BoxDecoration(
        color: colorOf[value],
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      height: length,
      width: length,
      alignment: Alignment.center,
      child: Text(value.toString()),
    );
  }
}

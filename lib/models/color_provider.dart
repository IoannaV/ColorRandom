import 'package:flutter/material.dart';
import 'dart:math';

class ColorCreator extends ChangeNotifier {
  Color _color = Color.fromRGBO(150, 0, 255, 1);
  Color _colorPrev = Color.fromRGBO(255, 255, 255, 1);

  ColorCreator();

  Color get color => _color;

  Color get colorPrev => _colorPrev;

  void createRandomColor() {
    var randomizer = Random();
    _color = Color.fromRGBO(randomizer.nextInt(255), randomizer.nextInt(255),
        randomizer.nextInt(255), 1);
    notifyListeners();
  }

  void rewriteColor() {
    _colorPrev = _color;
  }
}

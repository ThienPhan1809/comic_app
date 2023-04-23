import 'package:flutter/material.dart';

enum ComicColorTheme implements Comparable<ComicColorTheme> {
  white(backgroundColor: Colors.white, textColor: Colors.black),
  green(backgroundColor: Colors.green, textColor: Colors.black),
  blue(backgroundColor: Colors.blue, textColor: Colors.black),
  black(backgroundColor: Colors.black87, textColor: Colors.white);

  const ComicColorTheme(
      {required this.backgroundColor, required this.textColor});

  final Color backgroundColor;
  final Color textColor;

  @override
  int compareTo(ComicColorTheme other) => 0;
}

class ColorController extends ChangeNotifier {
  ComicColorTheme _color = ComicColorTheme.white;
  void changeColorTheme(ComicColorTheme color) {
    _color = color;
    notifyListeners();
  }

  ComicColorTheme get currentColor => _color;
}

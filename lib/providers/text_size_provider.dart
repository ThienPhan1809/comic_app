import 'package:flutter/material.dart';

class FontSizeController with ChangeNotifier {
  double _value = 20;

  double get value => _value;

  void changeSize(double newValue) {
    _value = newValue;
    notifyListeners();
  }
}

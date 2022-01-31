import 'dart:ui';

import 'package:flutter/foundation.dart';

class PaintingColorBarProvider extends ChangeNotifier {
  PaintingColorBarProvider(Color startingColor) {
    _selectedColor = startingColor;
    notifyListeners();
  }

  late Color _selectedColor;

  set selectedColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  bool isColorSelected(Color color) {
    return color == _selectedColor;
  }
}

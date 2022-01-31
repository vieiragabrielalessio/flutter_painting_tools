import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_painting_tools/flutter_painting_tools.dart';

/// Controller for the [PaintingBoard] used to manage
/// specific tasks.
class PaintingBoardController {
  final StreamController<PaintingBoardControllerEvent> _controller =
      StreamController<PaintingBoardControllerEvent>();
  Stream<PaintingBoardControllerEvent> get state => _controller.stream;

  void deletePainting() {
    _controller.add(PaintingBoardControllerPaintingDeleted());
  }

  void changeBrushColor(Color color) {
    _controller.add(PaintingBoardControllerBrushColorChanged(color));
  }

  void dispose() {
    _controller.close();
  }

  void deleteLastLine() {
    _controller.add(PaintingBoardControllerLastLineDeleted());
  }
}

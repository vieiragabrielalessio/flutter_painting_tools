import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_painting_tools/flutter_painting_tools.dart';
import 'package:flutter_painting_tools/logic/painting_board_controller/painting_board_controller_event.dart';

/// Controller for the [PaintingBoard] used to manage
/// specific tasks.
class PaintingBoardController {
  PaintingBoardController() {
    _controller = StreamController<PaintingBoardControllerEvent>();
    onEventChanged = _controller.stream;
  }

  late final StreamController<PaintingBoardControllerEvent> _controller;
  late final Stream<PaintingBoardControllerEvent> onEventChanged;

  void deletePainting() {
    _controller.sink.add(PaintingBoardControllerPaintingDeleted());
  }

  void changeBrushColor(Color color) {
    _controller.sink.add(PaintingBoardControllerBrushColorChanged(color));
  }

  void dispose() {
    _controller.close();
  }
}

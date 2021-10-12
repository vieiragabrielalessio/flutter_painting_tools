import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_painting_tools/flutter_painting_tools.dart';

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

  void deleteLastLine() {
    _controller.sink.add(PaintingBoardControllerLastLineDeleted());
  }

  /// This method allows the user to convert the content of the [PaintingBoard]
  /// into a .png file that is saved in the gallery.
  ///
  /// NOTE: this method only works on Android and IOS.
  void savePaintingToGallery() {
    _controller.sink.add(PaintingBoardControllerPaintingSavedToGallery());
  }
}

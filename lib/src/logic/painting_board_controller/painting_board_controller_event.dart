import 'dart:ui';

abstract class PaintingBoardControllerEvent {}

/// Event called when user delets the painting.
class PaintingBoardControllerPaintingDeleted
    extends PaintingBoardControllerEvent {}

/// Event called when user changes the color of the brush used to paint.
class PaintingBoardControllerBrushColorChanged
    extends PaintingBoardControllerEvent {
  PaintingBoardControllerBrushColorChanged(this.color);

  /// New color to use to paint.
  final Color color;
}

class PaintingBoardControllerLastLineDeleted
    extends PaintingBoardControllerEvent {}

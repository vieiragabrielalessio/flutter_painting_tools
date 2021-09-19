import 'dart:async';

/// Controller for the [PaintingBoard] used to manage
/// specific tasks.
class PaintingBoardController {
  PaintingBoardController() {
    _controller = StreamController<PaintingBoardControllerEventType>();
    onEventChanged = _controller.stream;
  }

  late final StreamController<PaintingBoardControllerEventType> _controller;
  late final Stream<PaintingBoardControllerEventType> onEventChanged;

  void deletePainting() {
    _controller.sink.add(PaintingBoardControllerEventType.paintingDeleted);
  }

  void dispose() {
    _controller.close();
  }
}

enum PaintingBoardControllerEventType { paintingDeleted }

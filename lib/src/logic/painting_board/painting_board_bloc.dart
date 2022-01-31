import 'dart:async';
import 'dart:ui';

import 'package:flutter_painting_tools/flutter_painting_tools.dart';
import 'package:flutter_painting_tools/src/data/repositories/painting_board_repository.dart';
import 'package:flutter_painting_tools/src/logic/painting_board/painting_board_state.dart';

/// Bloc used to manage the state of the painting board
class PaintingBoardBloc {
  /// Creates the bloc with the initial state of [PaintingBoardInitial].
  PaintingBoardBloc({
    required double boardHeight,
    required double boardWidth,
    required PaintingBoardController paintingBoardController,
  }) : super() {
    repository = PaintingBoardRepository(
      boardHeight: boardHeight,
      boardWidth: boardWidth,
    );

    /// Listen to changes on the [PaintingBoardController] and to something based
    /// on what happened.
    paintingBoardController.onEventChanged
        .listen((PaintingBoardControllerEvent event) {
      if (event is PaintingBoardControllerPaintingDeleted) {
        /// Delete the painting.
        repository.deletePainting();
        deletePaintingBoard();
      } else if (event is PaintingBoardControllerBrushColorChanged) {
        /// Update the brush color in the repository.
        repository.brushColor = event.color;
      } else if (event is PaintingBoardControllerLastLineDeleted) {
        /// Delete last line.
        repository.deleteLastLine();
        deleteLastLine();
      }
    });
  }

  late final PaintingBoardRepository repository;

  final StreamController<PaintingBoardState> _controller =
      StreamController<PaintingBoardState>();
  Stream<PaintingBoardState> get state => _controller.stream;

  void updateLine(Offset position) {
    repository.addPoint(position);
    _controller.add(PaintingBoardInProgress(repository.points));
  }

  void endLine() {
    repository.addEndLinePoint();
    _controller.add(PaintingBoardInProgress(repository.points));
  }

  void deletePaintingBoard() => _controller.add(PaintingBoardInitial());

  void deleteLastLine() =>
      _controller.add(PaintingBoardInProgress(repository.points));
}

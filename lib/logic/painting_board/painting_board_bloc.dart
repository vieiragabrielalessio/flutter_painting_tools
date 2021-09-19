import 'package:bloc/bloc.dart';
import 'package:flutter_painting_tools/data/repositories/painting_board_repository.dart';
import 'package:flutter_painting_tools/flutter_painting_tools.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_event.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_state.dart';
import 'package:flutter_painting_tools/logic/painting_board_controller/painting_board_controller_event.dart';

/// Bloc used to manage the state of the painting board
class PaintingBoardBloc extends Bloc<PaintingBoardEvent, PaintingBoardState> {
  /// Creates the bloc with the initial state of [PaintingBoardInitial].
  PaintingBoardBloc({
    required double boardHeight,
    required double boardWidth,
    required PaintingBoardController paintingBoardController,
  }) : super(PaintingBoardInitial()) {
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
        add(PaintingBoardDeleted());
      } else if (event is PaintingBoardControllerBrushColorChanged) {
        /// Update the brush color in the repository.
        repository.brushColor = event.color;
      }
    });
  }

  /// Create a repository.
  late final PaintingBoardRepository repository;

  @override
  Stream<PaintingBoardState> mapEventToState(PaintingBoardEvent event) async* {
    if (event is PaintingBoardLineStarted) {
      // print('line started at: ${event.position}');
      repository.addPoint(event.position);

      yield PaintingBoardInProgress(repository.points);
    } else if (event is PaintingBoardLineUpdated) {
      // print('line updated at: ${event.position}');
      repository.addPoint(event.position);
      yield PaintingBoardInProgress(repository.points);
    } else if (event is PaintingBoardLineEnded) {
      // print('line ended');
      repository.addEndLinePoint();
      yield PaintingBoardInProgress(repository.points);
    } else if (event is PaintingBoardDeleted) {
      yield PaintingBoardInitial();
    }
  }
}

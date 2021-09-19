import 'package:flutter_painting_tools/data/models/painting_board_point.dart';

abstract class PaintingBoardState {}

/// The intial state of the painting board.
///
/// The board is empty.
class PaintingBoardInitial extends PaintingBoardState {}

/// The state emitted when the painting board contains at least
/// one point, so the user is currently painting.
///
/// The board is not empty.
class PaintingBoardInProgress extends PaintingBoardState {
  PaintingBoardInProgress(this.points);

  /// The list of point used to represent the painting.
  final List<PaintingBoardPoint?> points;
}

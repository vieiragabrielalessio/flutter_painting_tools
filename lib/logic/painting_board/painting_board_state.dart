import 'package:flutter_painting_tools/data/models/painting_board_point.dart';

abstract class PaintingBoardState {
  PaintingBoardState(this.points);

  /// The list of point used to represent the painting.
  final List<PaintingBoardPoint?> points;
}

/// The intial state of the painting board.
///
/// The board is empty.
class PaintingBoardInitial extends PaintingBoardState {
  PaintingBoardInitial() : super(<PaintingBoardPoint?>[]);
}

/// The state emitted when the painting board contains at least
/// one point, so the user is currently painting.
///
/// The board is not empty.
class PaintingBoardInProgress extends PaintingBoardState {
  PaintingBoardInProgress(List<PaintingBoardPoint?> points) : super(points);
}

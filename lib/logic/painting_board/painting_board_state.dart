abstract class PaintingBoardState {}

/// The intial state of the painting board.
///
/// The board is empty.
class PaintingBoardInitial extends PaintingBoardState {}

/// The state emitted when the painting board contains at least
/// one point, so the user is currently painting.
///
/// The board is not empty.
class PaintingBoardInProgress extends PaintingBoardState {}

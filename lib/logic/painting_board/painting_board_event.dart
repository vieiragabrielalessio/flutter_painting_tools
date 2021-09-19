abstract class PaintingBoardEvent {}

/// This event is called every time the user starts tapping the screen
/// to paint a new line.
class PaintingBoardLineStarted extends PaintingBoardEvent {}

/// This event is called every time user has already started painting and moves the finger
/// on the screen. So the user is updating the current line.
class PaintingBoardLineUpdated extends PaintingBoardEvent {}

/// This event is called every time user ends a line by removing the finger from
/// the screen.
class PaintingBoardLineEnded extends PaintingBoardEvent {}

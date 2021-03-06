import 'dart:ui';

/// A model of each point represented on the [PaintingBoard].
class PaintingBoardPoint {
  PaintingBoardPoint({
    required this.position,
    required this.paint,
  });

  /// The position of each point.
  final Offset position;

  /// The [Paint] used to display each point.
  final Paint paint;

  PaintingBoardPoint copyWith({
    Offset? position,
    Paint? paint,
  }) =>
      PaintingBoardPoint(
        position: position ?? this.position,
        paint: paint ?? this.paint,
      );
}

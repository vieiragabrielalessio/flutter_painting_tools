import 'dart:ui';

import 'package:flutter_painting_tools/data/models/painting_board_point.dart';

/// A repository that communicates with [PaintingBoardBloc] to manage operations
/// on the [PaintingBoard].

class PaintingBoardRepository {
  PaintingBoardRepository({
    required double boardHeight,
    required double boardWidth,
  })  : _boardHeight = boardHeight,
        _boardWidth = boardWidth;

  /// The height of the [PaintingBoard].
  late final double _boardHeight;

  /// The width of the [PaintingBoard].
  late final double _boardWidth;

  /// The list of points used to represent the painting.
  final List<PaintingBoardPoint?> _points = <PaintingBoardPoint?>[];
  List<PaintingBoardPoint?> get points => _points;

  /// A method to add a new point to [_points].
  void addPoint(PaintingBoardPoint point) {
    final PaintingBoardPoint validatedPoint = _validatePoint(point);
    _points.add(validatedPoint);
  }

  /// Method called when a line ends. It just adds `null` to [_points].
  void addEndLinePoint() {
    _points.add(null);
  }

  /// A private method which returns the point with the validated position.
  ///
  /// If a point is negative or bigger than height or size of the [PaintingBoard],
  /// its value must be changed.
  PaintingBoardPoint _validatePoint(PaintingBoardPoint point) {
    /// X coordinate of the point.
    double x = point.position.dx;

    /// Y coordinate of the point.
    double y = point.position.dy;

    /// If the X coordinate is negative or higher than the width of
    /// the board then change its value.
    if (x < 0)
      x = 0;
    else if (x > _boardWidth) x = _boardWidth;

    /// If the Y coordinate is negative or higher than the height of
    /// the board then change its value.
    if (y < 0)
      y = 0;
    else if (y > _boardHeight) y = _boardHeight;

    /// Return the point with a validate position.
    return point.copyWith(position: Offset(x, y));
  }

  void deletePainting() {
    _points.clear();
  }
}

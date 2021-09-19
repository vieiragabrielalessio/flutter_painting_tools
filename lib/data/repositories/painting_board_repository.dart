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
  void addPoint(PaintingBoardPoint? point) {
    if (point == null || _validatePoint(point.position)) _points.add(point);
  }

  /// A private method which returns true if the position of the point is
  /// inside the [PaintingBoard] and then the point can be displayed.
  bool _validatePoint(Offset position) =>
      position.dx > 0 &&
      position.dy > 0 &&
      position.dx < _boardWidth &&
      position.dy < _boardHeight;
}

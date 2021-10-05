import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_painting_tools/src/data/models/painting_board_point.dart';

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

  /// The [Color] used to paint lines in the [PaintingBoard].
  ///
  /// The starting/default value is [Colors.black].
  Color _brushColor = Colors.black;
  set brushColor(Color color) => _brushColor = color;

  /// A method to add a new point to [_points].
  void addPoint(Offset position) {
    final Offset validatedPosition = _validatePosition(position);
    final PaintingBoardPoint point = PaintingBoardPoint(
      position: validatedPosition,
      paint: Paint()
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5
        ..color = _brushColor,
    );
    _points.add(point);
  }

  /// Method called when a line ends. It just adds `null` to [_points].
  void addEndLinePoint() {
    _points.add(null);
  }

  /// A private method which returns the validated position of each point.
  ///
  /// If a point is negative or bigger than height or size of the [PaintingBoard],
  /// its value must be changed.
  Offset _validatePosition(Offset position) {
    /// X coordinate of the point.
    double x = position.dx;

    /// Y coordinate of the point.
    double y = position.dy;

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
    return Offset(x, y);
  }

  /// Method that deletes everything inside [_points] and restore [_linesCount].
  void deletePainting() {
    _points.clear();
  }

  /// Method that deletes the last line painted by the user.
  void deleteLastLine() {
    /// If the [PaintingBoard] is empty we do not need to delete things.
    if (_points.isNotEmpty) {
      /// Remove the last element of [_points] just to perform operations.
      ///
      /// We now that the last element of [_points] is always a [null].
      _points.removeLast();

      /// The length of the [_points].
      final int length = _points.length;

      /// Last position where we can find a [null].
      ///
      /// Then we can delete from here to the end of the list ([_points]).
      final int lastIndexNull = _points.lastIndexOf(null);

      /* 
        !debug
        print('len: $length');
        print('last null: $lastIndexNull');
        print('last point: ${length - 1}'); */

      /// Remove points from the last null to the end.
      _points.removeRange(lastIndexNull + 1, length);
    }
  }
}

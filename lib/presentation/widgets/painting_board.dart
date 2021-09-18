import 'package:flutter/material.dart';

class PaintingBoard extends StatelessWidget {
  /// A board where the user can paint.
  const PaintingBoard({
    Key? key,
    double? boardHeight,
    double? boardWidth,
  })  : _boardHeight = boardHeight ?? double.infinity,
        _boardWidth = boardWidth ?? double.infinity,
        super(key: key);

  /// The height of the board.
  ///
  /// If this property is not set, the board will take as much as possible.
  /// vertical space.
  final double _boardHeight;

  /// The width of the board.
  ///
  /// If this property is not set, the board will take as much as possible.
  /// horizontal space.
  final double _boardWidth;

  @override
  Widget build(BuildContext context) => Container(
        height: _boardHeight,
        width: _boardWidth,
      );
}

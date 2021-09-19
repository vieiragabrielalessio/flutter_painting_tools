import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_bloc.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_event.dart';

class PaintingBoard extends StatelessWidget {
  /// A board where the user can paint.
  const PaintingBoard({
    Key? key,
    double? boardHeight,
    double? boardWidth,
    Color? boardBackgroundColor,
    BoxDecoration? boardDecoration,
  })  : assert(
          boardBackgroundColor == null || boardDecoration == null,
          'Cannot provide both a boardBackgroundColor and a boardDecoration\n'
          'To provide both, use "boardDecoration: BoxDecoration(color: boardDecoration)".',
        ),
        _boardHeight = boardHeight ?? double.infinity,
        _boardWidth = boardWidth ?? double.infinity,
        _boardBackgroundColor = boardBackgroundColor ??
            (boardDecoration == null ? Colors.grey : null),
        _boardDecoration = boardDecoration,
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

  /// The background color of the board.
  ///
  /// Note that if this property is set, [_boardDecoration] must be null.
  ///
  /// If this value is not set and [_boardDecoration] is not provided,
  /// the default background color will be [Colors.grey].
  final Color? _boardBackgroundColor;

  /// The decoration applied to the painting board.
  ///
  /// Note that if this property is set, [_boardBackgroundColor] must be null.s
  final BoxDecoration? _boardDecoration;

  @override
  Widget build(BuildContext context) => BlocProvider<PaintingBoardBloc>(
        create: (_) => PaintingBoardBloc(),
        child: Builder(
            builder: (BuildContext context) => Container(
                  height: _boardHeight,
                  width: _boardWidth,
                  color: _boardBackgroundColor,
                  decoration: _boardDecoration,
                  child: GestureDetector(
                    onPanStart: (DragStartDetails details) {
                      final Offset position = details.localPosition;
                      BlocProvider.of<PaintingBoardBloc>(context)
                          .add(PaintingBoardLineStarted(position));
                    },
                    onPanUpdate: (DragUpdateDetails details) {
                      final Offset position = details.localPosition;
                      BlocProvider.of<PaintingBoardBloc>(context)
                          .add(PaintingBoardLineUpdated(position));
                    },
                    onPanEnd: (_) {
                      BlocProvider.of<PaintingBoardBloc>(context)
                          .add(PaintingBoardLineEnded());
                    },
                  ),
                )),
      );
}

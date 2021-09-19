import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painting_tools/data/models/painting_board_point.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_event.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_state.dart';

/// Bloc used to manage the state of the painting board
class PaintingBoardBloc extends Bloc<PaintingBoardEvent, PaintingBoardState> {
  /// Creates the bloc with the initial state of [PaintingBoardInitial].
  PaintingBoardBloc() : super(PaintingBoardInitial());

  final List<PaintingBoardPoint?> points = <PaintingBoardPoint?>[];

  @override
  Stream<PaintingBoardState> mapEventToState(PaintingBoardEvent event) async* {
    if (event is PaintingBoardLineStarted) {
      // print('line started at: ${event.position}');
      points.add(
        PaintingBoardPoint(
          position: event.position,
          paint: Paint()
            ..color = Colors.black
            ..strokeJoin = StrokeJoin.round
            ..strokeCap = StrokeCap.round
            ..strokeWidth = 5,
        ),
      );
      yield PaintingBoardInProgress(points);
    } else if (event is PaintingBoardLineUpdated) {
      // print('line updated at: ${event.position}');
      points.add(
        PaintingBoardPoint(
          position: event.position,
          paint: Paint()
            ..color = Colors.black
            ..strokeJoin = StrokeJoin.round
            ..strokeCap = StrokeCap.round
            ..strokeWidth = 5,
        ),
      );
      yield PaintingBoardInProgress(points);
    } else if (event is PaintingBoardLineEnded) {
      // print('line ended');
      points.add(null);
      yield PaintingBoardInProgress(points);
    }
  }
}

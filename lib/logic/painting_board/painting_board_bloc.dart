import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_event.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_state.dart';

/// Bloc used to manage the state of the painting board
class PaintingBoardBloc extends Bloc<PaintingBoardEvent, PaintingBoardState> {
  /// Creates the bloc with the initial state of [PaintingBoardInitial].
  PaintingBoardBloc() : super(PaintingBoardInitial());

  final List<Offset> points = <Offset>[];

  @override
  Stream<PaintingBoardState> mapEventToState(PaintingBoardEvent event) async* {
    if (event is PaintingBoardLineStarted) {
      // print('line started at: ${event.position}');
      points.add(event.position);
      yield PaintingBoardInProgress(points);
    } else if (event is PaintingBoardLineUpdated) {
      // print('line updated at: ${event.position}');
      points.add(event.position);
      yield PaintingBoardInProgress(points);
    } else if (event is PaintingBoardLineEnded) {
      points.clear();
      // print('line ended');
    }
  }
}

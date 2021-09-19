import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painting_tools/data/models/painting_board_point.dart';
import 'package:flutter_painting_tools/data/repositories/painting_board_repository.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_event.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_state.dart';

/// Bloc used to manage the state of the painting board
class PaintingBoardBloc extends Bloc<PaintingBoardEvent, PaintingBoardState> {
  /// Creates the bloc with the initial state of [PaintingBoardInitial].
  PaintingBoardBloc({
    required double boardHeight,
    required double boardWidth,
  }) : super(PaintingBoardInitial()) {
    repository = PaintingBoardRepository(
      boardHeight: boardHeight,
      boardWidth: boardWidth,
    );
  }

  /// Create a repository.
  late final PaintingBoardRepository repository;

  @override
  Stream<PaintingBoardState> mapEventToState(PaintingBoardEvent event) async* {
    if (event is PaintingBoardLineStarted) {
      // print('line started at: ${event.position}');
      repository.addPoint(
        PaintingBoardPoint(
          position: event.position,
          paint: Paint()
            ..color = Colors.black
            ..strokeJoin = StrokeJoin.round
            ..strokeCap = StrokeCap.round
            ..strokeWidth = 5,
        ),
      );

      yield PaintingBoardInProgress(repository.points);
    } else if (event is PaintingBoardLineUpdated) {
      // print('line updated at: ${event.position}');
      repository.addPoint(
        PaintingBoardPoint(
          position: event.position,
          paint: Paint()
            ..color = Colors.black
            ..strokeJoin = StrokeJoin.round
            ..strokeCap = StrokeCap.round
            ..strokeWidth = 5,
        ),
      );
      yield PaintingBoardInProgress(repository.points);
    } else if (event is PaintingBoardLineEnded) {
      // print('line ended');
      repository.addEndLinePoint();
      yield PaintingBoardInProgress(repository.points);
    }
  }
}

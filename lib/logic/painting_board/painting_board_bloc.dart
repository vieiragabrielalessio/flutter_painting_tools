import 'package:bloc/bloc.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_event.dart';
import 'package:flutter_painting_tools/logic/painting_board/painting_board_state.dart';

/// Bloc used to manage the state of the painting board
class PaintingBoardBloc extends Bloc<PaintingBoardEvent, PaintingBoardState> {
  /// Creates the bloc with the initial state of [PaintingBoardInitial].
  PaintingBoardBloc() : super(PaintingBoardInitial());

  @override
  Stream<PaintingBoardState> mapEventToState(PaintingBoardEvent event) async* {
    // TODO: implement mapEventToState
  }
}

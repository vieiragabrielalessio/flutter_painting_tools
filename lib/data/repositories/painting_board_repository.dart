import 'package:flutter_painting_tools/data/models/painting_board_point.dart';

/// A repository that communicates with [PaintingBoardBloc] to manage operations
/// on the [PaintingBoard].

class PaintingBoardRepository {
  /// The list of points used to represent the painting.
  final List<PaintingBoardPoint?> _points = <PaintingBoardPoint?>[];
  List<PaintingBoardPoint?> get points => _points;

  /// A method to add a new point to [_points].
  void addPoint(PaintingBoardPoint? point) {
    _points.add(point);
  }
}

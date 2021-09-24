import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_painting_tools/src/data/models/painting_board_point.dart';

class PaintingBoardPainter extends CustomPainter {
  PaintingBoardPainter(this.points);

  /// The list of point used to represent the painting.
  final List<PaintingBoardPoint?> points;
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
          points[i]!.position,
          points[i + 1]!.position,
          points[i]!.paint,
        );
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(
          PointMode.points,
          <Offset>[points[i]!.position],
          points[i]!.paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(PaintingBoardPainter oldDelegate) => true;
}

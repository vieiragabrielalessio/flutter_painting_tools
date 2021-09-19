import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaintingBoardPainter extends CustomPainter {
  PaintingBoardPainter(this.points);

  /// The list of point used to represent the painting.
  final List<Offset> points;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(PaintingBoardPainter oldDelegate) => true;
}

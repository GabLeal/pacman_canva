import 'dart:math';

import 'package:flutter/material.dart';

class PacManCanva extends CustomPainter {
  final double value;
  final double foodValue;

  PacManCanva(
    this.value,
    this.foodValue,
  );

  Paint get foodPaint {
    return Paint()..color = const Color(0xFFfdff00);
  }

  Paint get bodyPaint {
    return Paint()
      ..color = const Color(0xFFfdff00)
      ..style = PaintingStyle.fill;
  }

  Paint get strokeBodyPaint {
    return Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
  }

  Paint get eyesPaint {
    return Paint()..color = Colors.black;
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawFood(canvas, size, foodPaint);
    drawBodyPacman(canvas, size, bodyPaint);
    drawBodyPacman(canvas, size, strokeBodyPaint);
    drawEyes(canvas, size, eyesPaint);
  }

  void drawBodyPacman(Canvas canvas, Size size, Paint paint) {
    //draw arc
    final rect = Rect.fromLTWH(0, 0, size.width, size.width);

    //radianos = graus * (PI / 180);
    var startAngle = value / 100;
    var sweepAngle = (360 - value / 2) * pi / 180 - value / 100;
    const useCenter = true;

    canvas.drawArc(
      rect,
      startAngle.toDouble(), //radians
      sweepAngle.toDouble(), //radians
      useCenter,
      paint,
    );
  }

  void drawFood(Canvas canvas, Size size, Paint paint) {
    canvas.drawCircle(
      Offset(
        foodValue + 20,
        size.height / 2,
      ),
      11,
      paint,
    );
  }

  void drawEyes(Canvas canvas, Size size, Paint paint) {
    var eyesMove = value / 10;
    canvas.drawCircle(
      Offset(
        size.width / 1.8 - eyesMove,
        size.height / 4 - eyesMove,
      ),
      10,
      eyesPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

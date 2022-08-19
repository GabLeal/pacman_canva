import 'dart:math';

import 'package:flutter/material.dart';

class PacManCanva extends CustomPainter {
  final double value;
  final double foodValue;

  PacManCanva(
    this.value,
    this.foodValue,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final food = Paint()..color = const Color(0xFFfdff00);

    canvas.drawCircle(
      Offset(
        foodValue + 20,
        size.height / 2,
      ),
      11,
      food,
    );
    var paint1 = Paint()
      ..color = const Color(0xFFfdff00)
      ..style = PaintingStyle.fill;

    //draw arc
    final rect = Rect.fromLTWH(0, 0, size.width, size.width);

    //var radianos:Number = graus * (Math.PI / 180);

    var startAngle = value / 100;
    var sweepAngle = (360 - value / 2) * pi / 180 - value / 100;
    const useCenter = true;

    canvas.drawArc(
      rect,
      startAngle.toDouble(), //radians
      sweepAngle.toDouble(), //radians
      useCenter,
      paint1,
    );
    var paint11 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawArc(
      rect,
      startAngle.toDouble(), //radians
      sweepAngle.toDouble(), //radians
      useCenter,
      paint11,
    );
    var eyesMove = value / 10;
    final eyes = Paint()..color = Colors.black;

    canvas.drawCircle(
      Offset(
        size.width / 1.8 - eyesMove,
        size.height / 4 - eyesMove,
      ),
      10,
      eyes,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

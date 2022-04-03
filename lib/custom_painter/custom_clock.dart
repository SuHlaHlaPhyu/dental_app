import 'dart:math';

import 'package:flutter/material.dart';

class CustomClock extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    // var center = Offset(centerX, centerY);
    // var radius = min(centerX, centerY);
    var outerCircle = Paint()
      ..strokeWidth = 2.0
      ..color = const Color.fromARGB(255, 11, 128, 224)
      ..style = PaintingStyle.fill;

    var outerSecondCircle = Paint()
      ..strokeWidth = 2.0
      ..color = const Color.fromRGBO(45, 96, 183, 1)
      ..style = PaintingStyle.fill;

    // var dottedCircle = Paint()
    //   ..strokeWidth = 2.0
    //   ..color = const Color.fromARGB(255, 161, 158, 158)
    //   ..style = PaintingStyle.stroke;

    var innerCircle = Paint()
      ..strokeWidth = 0.0
      ..color = const Color.fromRGBO(26, 69, 140, 1)
      ..style = PaintingStyle.fill;

    // var dashBrush = Paint()
    //   ..color = Color(0xFFEAECFF)
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 1;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 150, outerCircle);
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 135, outerSecondCircle);
    final Paint paint = Paint()..color = Colors.white;
    double filledCircleRadius = 2;
    int numberOfDots = 22;
    final double radiantStep = 2 * pi / numberOfDots;

    for (int i = 0; i < numberOfDots; i++) {
      canvas.drawCircle(
        Offset(centerX + sin(i * radiantStep) * 105,
            centerY + cos(i * radiantStep) * 105),
        filledCircleRadius,
        paint,
      );
    }
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 70, innerCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

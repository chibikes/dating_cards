import 'dart:math';
import 'package:flutter/material.dart';

class CustomShapeWidget extends StatelessWidget {
  const CustomShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: CustomShapePainter(),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    double width = size.width;
    double height = size.height;
    double arcWidth = width * 0.15;
    double radius = height / 2;

    // Draw the rounded rectangle at the bottom
    Rect rect = Rect.fromLTWH(0, height - radius, width, radius);
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(radius)), paint);

    // Draw the arc in the middle
    double startX = (width - arcWidth) / 2;
    double endX = startX + arcWidth;
    double startY = height - radius * 2;
    double endY = height;
    canvas.drawArc(
        Rect.fromLTRB(startX, startY, endX, endY), pi, pi, true, paint);

    // Draw the lines to connect the arc to the rounded rectangle
    Path path = Path();
    path.moveTo(startX, startY);
    path.lineTo(0, startY);
    path.lineTo(0, height - radius);
    path.lineTo(rect.left, rect.bottom);
    path.arcTo(rect, pi, pi, false);
    path.lineTo(rect.right, rect.top);
    path.lineTo(rect.right, height - radius);
    path.lineTo(endX, startY);
    path.lineTo(width, startY);
    path.lineTo(width, height - radius);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

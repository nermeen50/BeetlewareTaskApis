import 'package:beetleware_task/model/color_model.dart';
import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = ColorModel.mainColor;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.2);

    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

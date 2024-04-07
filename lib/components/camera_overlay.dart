import 'package:flutter/material.dart';

class CameraOverlay extends CustomPainter {
  final double screenWidth;
  final double screenHeight;

  CameraOverlay({required this.screenWidth, required this.screenHeight});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 4.0;

    final circlePath = Path()
      ..addOval(Rect.fromCenter(
        center: Offset(screenWidth / 2, screenHeight / 2.5),
        width: 368 / 1.5,
        height: 474 / 1.5,
      ));

    // Path for the entire screen
    final outerPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, screenWidth, screenHeight));

    // Subtracting the oval from the full screen to create an overlay effect

    final overlayPath =
        Path.combine(PathOperation.difference, outerPath, circlePath);

    // Paint for the overlay (darker outside the oval)
    final overlayPaint = Paint()
      ..color = Colors.black.withOpacity(0.3) // Adjust opacity as needed
      ..style = PaintingStyle.fill;

    // Paint for the border of the oval
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Drawing the overlay
    canvas.drawPath(overlayPath, overlayPaint);

    // Drawing the oval border
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(screenWidth / 2, screenHeight / 2.5),
        width: 368 / 1.5,
        height: 474 / 1.5,
      ),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

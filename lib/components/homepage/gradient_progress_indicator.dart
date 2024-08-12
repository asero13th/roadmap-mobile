import 'package:flutter/material.dart';

class GradientProgressIndicator extends StatelessWidget {
  final double value;

  const GradientProgressIndicator({Key? key, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientProgressPainter(value),
      child: Container(
        height: 10, // Set the height of the progress bar
      ),
    );
  }
}

class _GradientProgressPainter extends CustomPainter {
  final double value;

  _GradientProgressPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFFFFF), Color(0xFFFF5106)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final backgroundPaint = Paint()..color = Colors.grey[300]!;

    // Draw the background
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Draw the progress
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width * value, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

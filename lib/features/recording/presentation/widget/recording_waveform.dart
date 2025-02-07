import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class RecordingWaveform extends StatelessWidget {
  const RecordingWaveform({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: CustomPaint(
        painter: WaveformPainter(),
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.secondaryColor
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    final path = Path();
    double waveHeight = size.height / 2;

    // Draw the waveform pattern
    for (double i = 0; i < size.width; i += 20) {
      path.moveTo(i, waveHeight);
      path.lineTo(i, waveHeight - (i % 40));
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

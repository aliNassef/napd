import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class PredictionCardWidget extends StatelessWidget {
  final String status;
  final int percentage;

  const PredictionCardWidget(
      {super.key, required this.status, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Color(0xFFFFF7FA),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 85),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            status,
            style: AppStyles.textStyle18SB.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

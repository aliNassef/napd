import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 85.w),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            status,
            style: AppStyles.roboto20Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

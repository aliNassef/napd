import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class RecordTimer extends StatelessWidget {
  const RecordTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '00:50',
      style: AppStyles.roboto36SemiBold.copyWith(
        color: AppColors.greyColor,
      ),
    );
  }
}

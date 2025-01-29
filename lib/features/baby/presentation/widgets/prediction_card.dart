import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PredictionCard extends StatelessWidget {
  final String status;
  final int percentage;

  const PredictionCard(
      {super.key, required this.status, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          status == 'hungry'.tr() ? Icons.local_drink : Icons.nights_stay,
          color: status == 'hungry'.tr()
              ? AppColors.secondaryColor
              : AppColors.greenLightColor,
        ),
        title: Text(
          status,
          style: AppStyles.roboto20Regular.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        trailing: Text(
          '$percentage%',
          style: AppStyles.roboto20Regular.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

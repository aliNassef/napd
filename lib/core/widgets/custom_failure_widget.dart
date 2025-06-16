import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: AppStyles.roboto14Regular.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

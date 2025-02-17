import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class StyledActionButton extends StatelessWidget {
  final String label;
  final bool isElevated;
  final VoidCallback onPressed;

  const StyledActionButton({
    super.key,
    required this.label,
    required this.isElevated,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isElevated
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(14),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Text(
              label.tr(),
              style: AppStyles.roboto18Regular.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(14),
              side: const BorderSide(color: AppColors.primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Text(
              label.tr(),
              style: AppStyles.roboto18Regular.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          );
  }
}

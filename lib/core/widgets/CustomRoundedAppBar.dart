import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/spacers.dart';

class CustomRoundedAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomRoundedAppBar({
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.secondaryColor, width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: onBackPressed ?? () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios_sharp,
                size: 38,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          Text(
            title,
            style: AppStyles.textStyle24B.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

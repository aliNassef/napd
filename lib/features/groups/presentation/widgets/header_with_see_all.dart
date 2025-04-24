import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class HeaderWithSeeAll extends StatelessWidget {
  const HeaderWithSeeAll({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.roboto24Bold.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            AppStrings.seeAll,
            style: AppStyles.roboto14Regular.copyWith(
              color: AppColors.greenLightColor,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ForyouHeader extends StatelessWidget {
  const ForyouHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'For you',
          style: AppStyles.roboto24Bold.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: AppStyles.roboto14Regular.copyWith(
              color: AppColors.greenLightColor,
            ),
          ),
        )
      ],
    ).withHorizontalPadding(16);
  }
}

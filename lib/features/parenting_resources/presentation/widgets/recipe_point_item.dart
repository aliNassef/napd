
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class RecipePointItem extends StatelessWidget {
  const RecipePointItem({
    super.key,
    required this.point,
  });
  final String point;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  •  ',
          style: AppStyles.roboto14Regular.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        Expanded(
          child: Text(
            point,
            style: AppStyles.roboto14Regular.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withValues(alpha: 0.14),
            blurRadius: 14,
            offset: Offset(0, 0),
          )
        ],
        //#00000014
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        leading: Icon(
          Icons.person,
          color: AppColors.darkBlueColor,
          size: 30,
        ),
        title: Text(
          title,
          style: AppStyles.textStyle20B.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.darkBlueColor,
          size: 22,
        ),
        onTap: onTap,
      ),
    );
  }
}

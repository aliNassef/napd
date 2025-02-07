import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'custom_switcher.dart';

class NotificationItemWithCheckBox extends StatelessWidget {
  const NotificationItemWithCheckBox({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xffEAE8E8),
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppStyles.roboto18Regular.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        trailing: CustomSwitcher(),
      ),
    );
  }
}

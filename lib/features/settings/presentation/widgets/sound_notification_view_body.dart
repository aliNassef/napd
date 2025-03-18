import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import 'notification_item_with_checkbox.dart';

class SoundNotificationsViewBody extends StatelessWidget {
  const SoundNotificationsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        Text(
          AppStrings.groupNotifications,
          style: AppStyles.roboto20Regular.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        NotificationItemWithCheckBox(
          title: AppStrings.soundNotifications,
        ),
        NotificationItemWithCheckBox(
          title: AppStrings.reactionNotifications,
        ),
        NotificationItemWithCheckBox(
          title: AppStrings.reminders,
        ),
        NotificationItemWithCheckBox(
          title: AppStrings.showPreview,
        ),
      ],
    ).withVerticalPadding(30).withHorizontalPadding(16);
  }
}

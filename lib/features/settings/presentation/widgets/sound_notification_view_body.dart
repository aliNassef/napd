import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
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
          'groupnotifications'.tr(),
          style: AppStyles.roboto20Regular.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        NotificationItemWithCheckBox(
          title: 'soundnotifications'.tr(),
        ),
        NotificationItemWithCheckBox(
          title: 'reactionnotifications'.tr(),
        ),
        NotificationItemWithCheckBox(
          title: 'reminders'.tr(),
        ),
        NotificationItemWithCheckBox(
          title: 'showpreview'.tr(),
        ),
      ],
    ).withVerticalPadding(30).withHorizontalPadding(16);
  }
}

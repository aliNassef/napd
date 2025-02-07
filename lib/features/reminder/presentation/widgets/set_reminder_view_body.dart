import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/helpers/notification_service.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';
import 'select_time_button.dart';

class SetReminderViewBody extends StatelessWidget {
  const SetReminderViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(54),
          Text(
            'filloutthefieldsandhitthesavebuttontoaddit'.tr(),
            style: AppStyles.roboto14Regular.copyWith(
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ).withHorizontalPadding(32),
          VerticalSpace(40),
          CustomTextFormField(
            hintText: 'title'.tr(),
            keyboardType: TextInputType.text,
            hintColor: Colors.black.withValues(alpha: 0.3),
            controller: TextEditingController(),
          ),
          VerticalSpace(40),
          CustomTextFormField(
            hintColor: Colors.black.withValues(alpha: 0.3),
            hintText: 'description'.tr(),
            keyboardType: TextInputType.text,
            controller: TextEditingController(),
            maxLines: 4,
          ),
          VerticalSpace(40),
          Text(
            'reminders'.tr(),
            style: AppStyles.roboto20SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          VerticalSpace(20),
          Text(
            'date'.tr(),
            style: AppStyles.roboto18Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          VerticalSpace(8),
          CalendarDatePicker(
            firstDate: DateTime.now(),
            initialDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateChanged: (DateTime date) {},
          ),
          SelectTimeButton(),
          VerticalSpace(20),
          DefaultAppButton(
            onPressed: () {
              _testNotification();
            },
            padding: context.width * 1 / 6,
            text: 'save'.tr(),
            backgroundColor: AppColors.secondaryColor,
            textColor: AppColors.primaryColor,
          ),
          VerticalSpace(10),
          DefaultAppButton(
            onPressed: (){
              Navigator.pop(context);
            },
            padding: context.width * 1 / 6,
            text: 'cancel'.tr(),
            backgroundColor: Color(0xffF9E9FC),
            textColor: AppColors.primaryColor,
          ),
          VerticalSpace(30),
        ],
      ).withHorizontalPadding(16),
    );
  }

  void _testNotification() {
    NotificationService.scheduleNotification(
      scheduledTime: DateTime.now().add(
        Duration(seconds: 30),
      ),
      title: 'title',
      body: 'body',
    );
  }
}

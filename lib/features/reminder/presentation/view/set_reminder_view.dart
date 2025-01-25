import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:napd/core/extensions/mediaquery_size.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/custom_text_form_field.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/reminder/presentation/widgets/select_time_button.dart';

import '../widgets/reminder_app_bar.dart';

class SetReminderView extends StatefulWidget {
  const SetReminderView({super.key});

  static const routeName = 'set-reminder';

  @override
  State<SetReminderView> createState() => _SetReminderViewState();
}

class _SetReminderViewState extends State<SetReminderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReminderAppBar(
        title: 'Add new reminder',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(54),
            Text(
              'Fill out the fields and hit the Save Button to add it!',
              style: AppStyles.roboto14Regular.copyWith(
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.center,
            ).withHorizontalPadding(32),
            VerticalSpace(40),
            CustomTextFormField(
              hintText: 'Title',
              keyboardType: TextInputType.text,
              hintColor: Colors.black.withValues(alpha: 0.3),
              controller: TextEditingController(),
            ),
            VerticalSpace(40),
            CustomTextFormField(
              hintColor: Colors.black.withValues(alpha: 0.3),
              hintText: 'Description',
              keyboardType: TextInputType.text,
              controller: TextEditingController(),
              maxLines: 4,
            ),
            VerticalSpace(40),
            Text(
              'Reminders',
              style: AppStyles.roboto20SemiBold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            VerticalSpace(20),
            Text(
              'Date',
              style: AppStyles.roboto18Regular.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            VerticalSpace(8),
            CalendarDatePicker(
              firstDate: DateTime.now(),
              initialDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateChanged: (DateTime date) {
                log(date.toString());
              },
            ),
            SelectTimeButton(),
            VerticalSpace(20),
            DefaultAppButton(
              padding: context.width * 1 / 6,
              text: 'Save',
              backgroundColor: AppColors.secondaryColor,
              textColor: AppColors.primaryColor,
            ),
            VerticalSpace(10),
            DefaultAppButton(
              padding: context.width * 1 / 6,
              text: 'Cancel',
              backgroundColor: Color(0xffF9E9FC),
              textColor: AppColors.primaryColor,
            ),
            VerticalSpace(30),
          ],
        ).withHorizontalPadding(16),
      ),
    );
  }
}

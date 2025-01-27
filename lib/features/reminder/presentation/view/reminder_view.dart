import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/reminder_view_body.dart';
import 'set_reminder_view.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});
  static const routeName = 'reminder';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'reminder'.tr(),
      ),
      body: ReminderViewBody(),
      floatingActionButton: _reminderFloatingButton(context),
    );
  }

  FloatingActionButton _reminderFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          SetReminderView.routeName,
        );
      },
      backgroundColor: AppColors.darkBlueColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

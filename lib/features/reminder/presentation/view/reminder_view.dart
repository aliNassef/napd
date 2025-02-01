import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/reminder_view_body.dart';
import 'set_reminder_view.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key, required this.controller});
  final PersistentTabController controller;
  static const routeName = 'reminder';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingTap: () {
          controller.index = 1;
        },
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

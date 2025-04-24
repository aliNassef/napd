import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubits/reminder_cubit.dart';
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
    return BlocProvider(
      create: (context) => injector<ReminderCubit>()..getReminders(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: CustomAppBar(
              onLeadingTap: () {
                controller.index = 1;
              },
              title: AppStrings.reminder,
            ),
            body: ReminderViewBody(),
            floatingActionButton: _reminderFloatingButton(context),
          );
        },
      ),
    );
  }

  FloatingActionButton _reminderFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final cubit = context.read<ReminderCubit>();
        Navigator.of(context, rootNavigator: true).pushNamed(
          SetReminderView.routeName,
          arguments: cubit,
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

import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/features/reminder/presentation/view/set_reminder_view.dart';

import '../widgets/routine_view_body.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({super.key});
  static const String routeName = 'routine_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RoutineViewBody().withHorizontalPadding(16),
      ),
      floatingActionButton: _routineFloatingButton(context),
    );
  }

  FloatingActionButton _routineFloatingButton(BuildContext context) {
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

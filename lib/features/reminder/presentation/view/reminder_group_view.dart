import 'package:flutter/material.dart';
import 'package:napd/features/reminder/presentation/view/reminder_view.dart';
import 'package:napd/features/reminder/presentation/view/routine_view.dart';
import 'package:napd/features/reminder/presentation/widgets/reminder_group_app_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ReminderGroupView extends StatelessWidget {
  const ReminderGroupView({super.key, required this.controller});
  final PersistentTabController controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 0),
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: ReminderGroupAppBar(),
        body: TabBarView(
          children: [
            ReminderView(),
            RoutineView(),
          ],
        ),
      ),
    );
  }
}

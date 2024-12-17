import 'package:flutter/material.dart';
import '../widgets/reminder_app_bar.dart';
import '../widgets/reminder_view_body.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});
  static const routeName = 'reminder';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReminderAppBar(),
      body: ReminderViewBody(),
    );
  }
}

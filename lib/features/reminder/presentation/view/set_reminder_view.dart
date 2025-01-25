import 'package:flutter/material.dart';
import 'package:napd/features/reminder/presentation/widgets/set_reminder_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

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
      appBar: CustomAppBar(
        title: 'Add new reminder',
      ),
      body: SafeArea(
        child: SetReminderViewBody(),
      ),
    );
  }
}

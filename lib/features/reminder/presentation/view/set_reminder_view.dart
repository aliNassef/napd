import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubits/reminder_cubit.dart';
import '../widgets/set_reminder_view_body.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

class SetReminderView extends StatefulWidget {
  const SetReminderView({super.key, required this.cubit});
  final ReminderCubit cubit;
  static const routeName = 'set-reminder';

  @override
  State<SetReminderView> createState() => _SetReminderViewState();
}

class _SetReminderViewState extends State<SetReminderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.addNewReminder,
      ),
      body: BlocProvider.value(
        value: widget.cubit,
        child: SafeArea(
          child: SetReminderViewBody(),
        ),
      ),
    );
  }
}

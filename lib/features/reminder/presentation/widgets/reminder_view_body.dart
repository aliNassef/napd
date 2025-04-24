import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/widgets/custom_failure_widget.dart';
import 'package:napd/features/reminder/data/model/reminder_model.dart';
import 'package:napd/features/reminder/presentation/cubits/reminder_cubit.dart';
import 'package:napd/features/reminder/presentation/cubits/reminder_state.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/spacers.dart';

import 'reminder_item.dart';

class ReminderViewBody extends StatelessWidget {
  const ReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderCubit, ReminderState>(
      buildWhen: (previous, current) =>
          current is ReminderLoading ||
          current is RemindersLoaded ||
          current is ReminderError,
      builder: (context, state) {
        if (state is ReminderLoading) {
          return Skeletonizer(
              enabled: true,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                itemBuilder: (_, __) => ReminderItem(
                  reminderModel: ReminderModel(
                    isCompleted: true,
                    id: 1,
                    title: 'ali nassef ibrahem ',
                    description: 'al a sas;lvxzm vl wkdvmdlm v ',
                    dateTime: DateTime.now(),
                  ),
                ),
                itemCount: 10,
                separatorBuilder: (_, __) => VerticalSpace(16),
              ));
        }
        if (state is ReminderError) {
          return CustomFailureWidget(errMessage: state.message);
        }
        if (state is RemindersLoaded) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            itemBuilder: (_, index) => ReminderItem(
              reminderModel: state.reminders[index],
            ),
            itemCount: state.reminders.length,
            separatorBuilder: (_, __) => VerticalSpace(16),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../data/model/reminder_model.dart';
import '../cubits/reminder_cubit.dart';
import '../cubits/reminder_state.dart';
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
              ),);
        }
        if (state is ReminderError) {
          return CustomFailureWidget(errMessage: state.message);
        }
        if (state is RemindersLoaded) {
          if (state.reminders.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VerticalSpace(context.height * 0.1),
                Image.asset(AppImages.noReminders),
                Text(
                  AppStrings.noReminderYet,
                  style: AppStyles.roboto24Bold.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
              ],
            );
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            itemBuilder: (_, index) => Slidable(
              direction: Axis.horizontal,
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    borderRadius: BorderRadius.circular(8),
                    onPressed: (context) {
                      context.read<ReminderCubit>().removeReminder(
                            state.reminders[index],
                          );
                    },
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: ReminderItem(
                reminderModel: state.reminders[index],
              ),
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

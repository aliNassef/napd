import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/show_error_message.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubits/reminder_cubit.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';
import '../../data/model/reminder_model.dart';
import '../cubits/reminder_state.dart';
import 'select_time_button.dart';

class SetReminderViewBody extends StatefulWidget {
  const SetReminderViewBody({
    super.key,
  });

  @override
  State<SetReminderViewBody> createState() => _SetReminderViewBodyState();
}

class _SetReminderViewBodyState extends State<SetReminderViewBody> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _selectedDate;

  @override
  initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _selectedDate = DateTime.now();
  }

  @override
  dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(54),
          Text(
            AppStrings.fillOutTheFields,
            style: AppStyles.roboto14Regular.copyWith(
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ).withHorizontalPadding(32),
          VerticalSpace(40),
          CustomTextFormField(
            inputColor: AppColors.darkBlueColor,
            hintText: AppStrings.title,
            keyboardType: TextInputType.text,
            hintColor: Colors.black.withValues(alpha: 0.3),
            controller: _titleController,
          ),
          VerticalSpace(40),
          CustomTextFormField(
            inputColor: AppColors.darkBlueColor,
            hintColor: Colors.black.withValues(alpha: 0.3),
            hintText: AppStrings.description,
            keyboardType: TextInputType.text,
            controller: _descriptionController,
            maxLines: 4,
          ),
          VerticalSpace(40),
          Text(
            AppStrings.reminders,
            style: AppStyles.roboto20SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          VerticalSpace(20),
          Text(
            AppStrings.date,
            style: AppStyles.roboto18Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          VerticalSpace(8),
          CalendarDatePicker(
            firstDate: DateTime.now(),
            initialDate: _selectedDate,
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateChanged: (DateTime date) {
              _selectedDate = date;
              setState(() {});
            },
          ),
          SelectTimeButton(
            initalTime: TimeOfDay.fromDateTime(_selectedDate),
            onTimeSelected: (timeOfDay) {
              setState(() {
                _selectedDate = DateTime(
                  _selectedDate.year,
                  _selectedDate.month,
                  _selectedDate.day,
                  timeOfDay.hour,
                  timeOfDay.minute,
                );
              });
              log(_selectedDate.toString());
            },
            // Add this parameter
          ),
          VerticalSpace(20),
          BlocListener<ReminderCubit, ReminderState>(
            listenWhen: (_, state) {
              return state is ReminderAdded || state is ReminderError;
            },
            listener: (context, state) {
              if (state is ReminderAdded) {
                Navigator.pop(context);
              }
              if (state is ReminderError) {
                showErrorMessage(context, errMessage: state.message);
              }
            },
            child: DefaultAppButton(
              onPressed: () {
                _addNotification();
              },
              text: AppStrings.save,
              backgroundColor: AppColors.secondaryColor,
              textColor: AppColors.primaryColor,
            ),
          ),
          VerticalSpace(10),
          DefaultAppButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: AppStrings.cancel,
            backgroundColor: Color(0xffF9E9FC),
            textColor: AppColors.primaryColor,
          ),
          VerticalSpace(30),
        ],
      ).withHorizontalPadding(16),
    );
  }

  void _addNotification() {
    if (_selectedDate.isBefore(DateTime.now())) {
      showErrorMessage(
        context,
        errMessage: "Selected date and time must be in the future.",
      );

      return;
    }
    if (_titleController.text.trim().isEmpty) {
      showErrorMessage(
        context,
        errMessage: "title can't be empty",
      );

      return;
    }
    context.read<ReminderCubit>().addReminder(
          ReminderModel(
            isCompleted: false,
            id: DateTime.now().millisecondsSinceEpoch,
            title: _titleController.text,
            description: _descriptionController.text,
            dateTime: _selectedDate,
          ),
        );
  }
}

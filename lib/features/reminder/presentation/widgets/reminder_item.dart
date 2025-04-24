import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../data/model/reminder_model.dart';
import 'reminder_date.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

class ReminderItem extends StatelessWidget {
  const ReminderItem({
    super.key,
    required this.reminderModel,
  });
  final ReminderModel reminderModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          AppShadows.shadow5,
        ],
      ),
      child: Row(
        children: [
          ReminderDate(
            day: reminderModel.dateTime.day,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reminderModel.title,
                    style: AppStyles.rubik20Medium.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  VerticalSpace(6),
                  Text(
                    reminderModel.description,
                    style: AppStyles.rubik14Light.copyWith(
                      color: Color(0xff808080),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  VerticalSpace(8),
                  Text(
                    '${reminderModel.dateTime.hour}:${reminderModel.dateTime.minute} ${reminderModel.dateTime.hour > 12 ? 'PM' : 'AM'} ',
                    style: AppStyles.rubik14Light.copyWith(
                      color: Color(0xff808080),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

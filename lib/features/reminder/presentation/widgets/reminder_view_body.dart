import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/widgets/spacers.dart';

import 'reminder_item.dart';

class ReminderViewBody extends StatelessWidget {
  const ReminderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      itemBuilder: (_, __) => ReminderItem(),
      itemCount: 10,
      separatorBuilder: (_, __) => VerticalSpace(16),
    );
  }
}

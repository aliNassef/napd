
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/spacers.dart';
import 'activity_item.dart';

class ActivitesViewBody extends StatelessWidget {
  const ActivitesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      itemBuilder: (_, index) {
        return ActivityItem();
      },
      separatorBuilder: (_, __) => const VerticalSpace(28),
      itemCount: 10,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/spacers.dart';
import 'group_item.dart';

class AllGroupsViewBody extends StatelessWidget {
  const AllGroupsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      itemBuilder: (_, index) => GroupItem(),
      separatorBuilder: (_, __) => VerticalSpace(12),
      itemCount: 10,
    );
  }
}

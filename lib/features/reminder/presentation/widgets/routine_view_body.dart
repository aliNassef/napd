import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'routine_item.dart';

class RoutineViewBody extends StatelessWidget {
  const RoutineViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
      itemBuilder: (context, index) => RoutineItem(),
      separatorBuilder: (context, index) => VerticalSpace(16),
      itemCount: 10,
    );
  }
}

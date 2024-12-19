import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/spacers.dart';
import 'nursery_item.dart';

class NurseryViewBody extends StatelessWidget {
  const NurseryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      itemBuilder: (_, int index) {
        return NurseryItem();
      },
      separatorBuilder: (_, __) => VerticalSpace(16),
      itemCount: 10,
    );
  }
}
